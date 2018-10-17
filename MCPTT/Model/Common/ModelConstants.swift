//
//  AES256Cipher.swift
//  mcpttapp
//
//  Created by Niranjan, Rajabhaiya on 20/09/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation

enum ChannelType {
    case Main
    case Sub
    case Dormant
}

public enum CallType {
    case RestrictedChatGroupCall
    case PreArrangendGroup
    case Private
    case AdhocGroup
    case BroadcastGroup
    case OffentGroup
    case Invalid
}

enum ChannelMediaType {
    case Audio
    case Video
    case Message
    case None
}

enum CallEndReason {
    case UserTriggered
    case LowBattery
    case OutOfBattery
    case Other
}

enum ContactType {
    case GMS
    case XDM
}

enum DisconnectCause {
    case Unknown
    case Error
    case Remote
    case Rejected
}

enum CallRejectReason {
    case UserRejected
    case Other
}

enum CommencementMode {
    case None
    case Manual
    case Auto
    case Force
}

enum LoginState {
    case LoggedOut
    case LoggingIn
    case LoggedIn
    case LoggingOut
    case Unknown
}

enum LoginReason {
    case InternalError
    case InvalidCredentials
    case NetwrokTemporarilyUnavailable
    case NoResponseFromServer
    case Normal
    case NotSupported
    case Other
    case ServerError
    case NoService
    case IMSServiceConnected // it does not come from IMS
}

public enum CallPriority {
    case Normal
    case Peril
    case Emergency
}

enum SessionDirection {
    case Incoming
    case Outgoing
    case unknown
}

// CallSessionState
enum SessionState {
    case Dialing
    case Ringing
    case Disconnected
    case Established
}

enum FtState {
    case Ready
    case Progress
    case Completed
    case Error
}

enum FtError {
    case Known
    case RemoteNotAvailable
    case RemoteCanceled
    case RemoteNoResponse
    case NetworkError
    case Timeout
    case FileIOError
    case MaxSizeExceeded
}

public enum TextMessageType {
    case Normal
    case Urgent
}

public enum SessionMessageType {
    case Miss
    case Start
    case End
}

// ModifyCall
enum ModifyCallState {
    case Unknown
    case Failed
    case Success
    case Request
}

// ModifyPriorityCall
enum ModifyPriorityCallState {
    case Unknonw
    case Failed
    case Success
    case Incoming
}

// FloorState
enum FloorState {
    case Unknown
    case Idle
    case Granted
    case Taken
    case Rejected
    case QueuePosition
    case Revoked
    case QueuedCancel
    case RequestTimeout
    case ReleaseTimeout
    case RequestRelease
    case Request
    case Release
}

enum Reason {
    case Success
    case InvalidInput
    case OperationNotAllowed
    case IMSNotReady
    case NotSupported
    case AlreadyEstablishedSession
    case D2DNotReady
    case Unknow
}

enum ResponseCodes: Int {
    case Forbidden = 403
    case MethodNotAllowed = 405
    case TemporarilyUnavailable = 480
    case NotAcceptableHere = 488
}

enum WarningCodes: Int {
    case WC103 = 103
    case WC124 = 12
    case WC127 = 127
}

enum PttWarningCode: Int {
    case None = 0
    case AlreadyHaveHalfDuplexVoiceCall = 900
    case AlreadyHaveHalfDuplexVodeoCall = 901
    case AlreadyHaveFullDuplexVoiceCall = 910
    case AlreadyHaveFullDuplexVodeoCall = 911
}

// FetchParticipantStatus
enum FetchParticipantStatus {
    case FetchParticipantStatusSuccess
    case FetchParticipantStatusFail
    case FetchParticipantStatusTerminated
    case FetchParticipantStatusIgnored
}

// PttConferenceParticipantState
enum ConferenceParticipantState {
    case Invalid
    case Inviting
    case Active
    case Removing
    case NonActive
    case Alerting
    case OnHold
    case Fail
}

// CmcDocumentType
enum CmcDocumentType {
    case Invalid
    case UEConfig
    case UserProfile
    case ServiceConfig
    case InitialUEConfig
    case KMS
}

enum AudioPath {
    case AP
    case CP
}
