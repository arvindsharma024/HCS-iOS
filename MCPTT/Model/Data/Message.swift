//
//  Message.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
public enum Type: Int {
    case text
    case floor
    case file
    case session
}
public class Message {
    var INVALID_URL = ""
    var sessionId: Int?
    var peerUrl: PttUrl
    var groupUrl: PttUrl
    var callType: CallType
    var time: Int
    var isOutgoing: Bool
    var isRead: Bool
    
   public init(sessionId: Int, peerUrl: PttUrl?, groupUrl: PttUrl?, callType: CallType?, time: Int, isOutgoing: Bool) {
    self.sessionId = sessionId
    self.peerUrl = peerUrl ?? PttUrl.init(urls: "")
    self.groupUrl = groupUrl ?? PttUrl.init(urls: "")
    self.callType = callType ?? CallType.invalid
    self.time = time
    self.isOutgoing = isOutgoing
    isRead = false
    }
    
    func type() -> Type? {
        return Type.session
    }
    
    func content() -> String? {
        return String(describing: type())
    }
    
    func getGroupUrl() -> PttUrl? {
        return  !groupUrl.isEmpty ? groupUrl : peerUrl
    }
    
    func setRead() {
        isRead = true
    }
    
    deinit {
    }
}
