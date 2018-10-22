//
//  MessageModelImpl.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

public class MessageModel {
    private static var TAG: String = "MessageModel"
    private static var HANDLE_MESSAGE_UPDATE: Int = 0
    var messageList: [Message] = []
    //dependancy classes are
 //PttNotificationManager
//    1. ModelMediator
//    2. ChannelImpl
//    3. android.os.Message  and Listener
//    4. Cursor
//    5. LocalDatabaseController.getInstance
//    6. dbController.query
//    7. ChannelDetailActivity ->of onMessageChanged listener
    
    //todo
    // private ChannelImpl mChannel;
    
    public init() { //
        //public MessageModelImpl(ModelMediator controlListener, ChannelImpl channel) {
        //    super(controlListener);
        //    mChannel = channel;
        //}
    }
    
    //todo port the listener
    //@Override
    //protected void handleListener(Listener listener, android.os.Message message) {
    //    switch (message.what) {
    //    case HANDLE_MESSAGE_UPDATE:
    //        listener.onMessageChanged();
    //        break;
    //    }
    //}
    
    //todo: get message details from db
    //@Override
    //public Cursor getMessageCursor(Channel channel) {
    //    return LocalDatabaseController.getInstance().getMessageCursor(mChannel);
    //}
    
    public func getMessageList() {
            // TODO: get Message list from db and return messageList
        
        //    LocalDatabaseController dbController = LocalDatabaseController.getInstance();
        //    //        Cursor cursor = dbController.query(DatabaseConstants.LocalDBTables.MESSAGE_DATABASE_TABLE,
        //    //                DatabaseConstants.MessageColumns)
    }
    
    public func sendMessage(message: String, textMessageType: TextMessageType) {
        //      let currentTime: Double = CFAbsoluteTimeGetCurrent()
        //todo :
        //       let textMessage: TextMessage?
        //        TextMessage(sessionId: mChannel.getSessionId(), peerUrl: LoggedInUserImpl.getInstance().getUri(), groupUrl: mChannel.getUri(), callType: mChannel.getCallType(), chatId:  mChannel.getSessionId(), contentType: TextMessage.DEFAULT_CONTENT_TYPE, contentBody: message, textMessageType: textMessageType, time: currentTime, isOutgoing: true)
        
        //   textMessage?.setRead()
        //  getControlListener().getMessageMediator().sendMessage(textMessage);
        
    }
    
    public func updateMessageRead() {
      //  getControlListener().getMessageMediator().updateMessageRead(mChannel);
    }
    
    public func createSessionMessage(sessionMessageType: SessionMessageType) {
        //    Session session = mChannel.getSession();
        //        var sessionMessage: SessionMessage = SessionMessage(mChannel.getSessionId(), groupUrl: mChannel.getUri(), callType: mChannel.getCallType(), callPriority: mChannel.getCallPriority(), time: session.getConnectTime(), sessionMessageType: sessionMessageType)
        if sessionMessageType != SessionMessageType.miss {
         //   sessionMessage.setRead()
        }
        //    LocalDatabaseController.getInstance().insertMessage(sessionMessage);
         //    invokeListener(HANDLE_MESSAGE_UPDATE);
    }
    
    public func onMessageUpdated() {
      //  invokeListener(HANDLE_MESSAGE_UPDATE);
    }
}
