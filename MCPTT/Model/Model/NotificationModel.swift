//
//  NotificationModel.swift
//  MCPTT
//
//  Created by Hemanth Kumar H N on 17/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
public class NotificationModel {
    private static var TAG: String = "NotificationModel"
    
    private static var HANDLE_CALL_STATE_CHANGED: Int = 0
    private static var HANDLE_NORMAL_MESSAGE_RECEIVED: Int = 1
    private static var HANDLE_SITUATION_MESSAGE_RECEIVED: Int = 2
    private static var HANDLE_MESSAGE_READ: Int = 3
    private static var HANDLE_FLOOR_STATE_CHANGED: Int = 4
    
    //to do : delegate or notification
    
//    func handleListener(android.os.Message message) {
//    switch (message.what) {
//    case HANDLE_CALL_STATE_CHANGED:
//    listener.onCallStateChanged((Channel) message.obj);
//    break;
//    case HANDLE_NORMAL_MESSAGE_RECEIVED:
//    listener.onNormalMessageReceived();
//    break;
//    case HANDLE_SITUATION_MESSAGE_RECEIVED:
//    listener.onSituationMessageReceived();
//    break;
//    case HANDLE_MESSAGE_READ:
//    listener.onMessageRead();
//    break;
//    case HANDLE_FLOOR_STATE_CHANGED:
//    listener.onFloorStateChanged((Channel) message.obj);
//    break;
//    }
//    }
    
    public func onCallStateChange() { // todo: Channel channel
        // invokeListener(HANDLE_CALL_STATE_CHANGED, channel);
    }
    
    public func onFloorStateChange() { //todo: Channel channel
        //invokeListener(HANDLE_FLOOR_STATE_CHANGED, channel);
    }
    
    public func onMessageReceived(isSituation: Bool) {
        if (isSituation) {
            //invokeListener(HANDLE_SITUATION_MESSAGE_RECEIVED);
        } else {
            //invokeListener(HANDLE_NORMAL_MESSAGE_RECEIVED);
        }
    }
}
