//
//  MessageBodyCache.swift
//  MCPTT
//
//  Created by Toor, Sanju on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

public class MessageBodyCache {
    
    private  let maxCapacity = 500 // SIZE
    private let messageBodyMap: CacheLRU<String, String>
    
    init() {
        messageBodyMap = CacheLRU(maxCapacity: maxCapacity)
    }
    
    public func get(key: String?) -> String? {
        guard let key = key else { return nil }
        return messageBodyMap.getValue(for: key)
    }
    
    public func set( key: String, value: String) {
        messageBodyMap.setValue(key, for: value)
    }
}

class CacheLRU<Key: Hashable, Value> {
    
    private struct CachePayload {
        let key: Key
        let value: Value
    }
    
    private let maxCapacity: Int
    private let list = DoublyLinkedList<CachePayload>()
    private var nodesDict = [Key: DoublyLinkedListNode<CachePayload>]()
    
    init(maxCapacity: Int) {
        self.maxCapacity = max(0, maxCapacity)
    }
    
    func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload(key: key, value: value)
        
        if let node = nodesDict[key] {
            node.payload = payload
            list.moveToHead(node)
        } else {
            let node = list.addHead(payload)
            nodesDict[key] = node
        }
        
        if list.count > maxCapacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key {
                nodesDict[key] = nil
            }
        }
    }
    
    func getValue(for key: Key) -> Value? {
        guard let node = nodesDict[key] else { return nil }
        
        list.moveToHead(node)
        
        return node.payload.value
    }
    
    func clear() {
    }
}
