//
//  TextMessage.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
public class TextMessage: Message {
    public static var DEFAULT_CONTENT_TYPE: String? = "UTF-8"
    private var chatId: Int?
    private var contentType: String? = ""
    private var contentBody: String?
    private var textMessageType: TextMessageType?
    
    public init(sessionId: Int, peerUrl: PttUrl, groupUrl: PttUrl, callType: CallType, chatId: Int, contentType: String, contentBody: String, textMessageType: TextMessageType, time: Int, isOutgoing: Bool) { //todo time should be long
        super.init(sessionId: sessionId, peerUrl: peerUrl, groupUrl: groupUrl, callType: callType, time: time, isOutgoing: isOutgoing)
        self.chatId = chatId
        self.contentType = contentType
        self.contentBody = contentBody
        self.textMessageType = textMessageType
    }
    override public func type() -> Type? {
        return super.type()
    }
    
    public func getType() -> Type? {
        return super.type()
    }
    
    public func getContentBody() -> String? {
            return contentBody
    }
    
    public func getContentType() -> String? {
        return contentType
    }
    
    public func getTextMessageType() -> TextMessageType? {
        return textMessageType
    }
//    public int() {
//    return mChatId;
//    }

    public var isActiveChannelMessage: Bool {
        return chatId != -1
    }
    
    public var isUrgent: Bool {
        return textMessageType == TextMessageType.urgent
    }
}
