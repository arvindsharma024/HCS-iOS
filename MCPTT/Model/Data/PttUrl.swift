//
//  PttUri.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

public class PttUrl {
    var url: URL?
    var INVALID_URL = ""
    var ADHOC_SCHEME = "adhoc:"
    
    init(urls: String?) {
        url = URL(fileURLWithPath: urls ?? INVALID_URL)
    }
    
    init(urls: URL?) {
        url = urls
    }
    
    func description() -> String {
        return String(describing: url?.port)
    }
    
    //todo
//    func copy(with zone: NSZone?) -> NSObject? {
//        copy.mUri = url
//        return PttUri.alloc(with: zone)(url)
//    }
    
    func compare(pttUrl: PttUrl?) -> Int {
        return (url?.absoluteString.compare(pttUrl?.url?.absoluteString ?? INVALID_URL))?.rawValue ?? Int()
    }
    
    func isEqual(url: PttUrl?) -> Bool {
        return url != nil && url?.isEqual(url: url) ?? false
    }
    
    var isEmpty: Bool {
        return url?.scheme?.isEmpty ?? false
    }
    var isValid: Bool {
        return url?.scheme?.isEmpty ?? false //!mUri.schemeSpecificPart().isEqual(to: INVALID_URL)
    }
    
    func hash() -> Int {
        return url?.hashValue ?? Int()
    }
    
    deinit {
    }
}
