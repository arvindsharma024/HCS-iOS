//
//  SessionMessage.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

public class SessionMessage: Message { //messagemodelImpl
    var type: Type?
    var callPriority: CallPriority?
    var start = false
    var sessionMessageType: SessionMessageType?
   
   public init(_ sessionId: Int, groupUrl: PttUrl?, callType: CallType?, callPriority: CallPriority?, time: Int, sessionMessageType: SessionMessageType?) {

    super.init(sessionId: sessionId, peerUrl: PttUrl.init(urls: ""), groupUrl: groupUrl, callType: callType, time: time, isOutgoing: (sessionMessageType != nil))
    }
    
    init(_ sessionId: Int, peerUrl: PttUrl?, groupUrl: PttUrl?, callType: CallType?, callPriority: CallPriority?, time: Int, sessionMessageType: SessionMessageType?) {
         super.init(sessionId: sessionId, peerUrl: peerUrl, groupUrl: groupUrl, callType: callType, time: time, isOutgoing: (sessionMessageType != nil))
        self.callPriority = callPriority
        self.sessionMessageType = sessionMessageType
    }
    
    //todo
    //    override func type() -> Type? {
    //        return Type.session
    //    }
    
    override func content() -> String? {
        return String(describing: type())
    }
    
    override func getGroupUrl() -> PttUrl? {
        return  !groupUrl.isEmpty ? groupUrl : peerUrl
    }
    
    override func setRead() {
        isRead = true
    }
    
    deinit {
    }
}
