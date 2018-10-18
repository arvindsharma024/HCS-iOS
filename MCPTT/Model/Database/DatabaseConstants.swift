//
//  DatabaseConstants.swift
//  MCPTT
//
//  Created by Toor, Sanju on 16/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

//  Local Database

enum LocalDBTables {
   static let MESSAGE_DATABASE_TABLE = "message_db_table"
   static let RECENT_LOG_DATABASE_TABLE = "recent_log_db_table"
}

enum  MessageColumns {
    static let MESSAGE_ID_ENTRY = "id"
    static let MESSAGE_USER_URI = "user_uri"
    static let MESSAGE_CHANNEL_URI_ENTRY = "channel_uri"
    static let MESSAGE_SESSION_ID_ENTRY = "session_id"
    static let MESSAGE_SENDER_URI_ENTRY = "sender_uri"
    static let MESSAGE_START_TIME = "start_time"
    static let MESSAGE_END_TIME = "end_time"
    static let MESSAGE_IM_BODY_ENTRY = "body"
    static let MESSAGE_IS_SITUATION_ENTRY = "is_situation"
    static let MESSAGE_FT_THUMBNAIL_KEY_ENTRY = "ft_thumbnail_key"
    static let MESSAGE_FT_URI_ENTRY = "ft_uri"
    static let MESSAGE_FT_STATE_ENTRY = "ft_state"
    static let MESSAGE_FT_AUDIO_DURATION_ENTRY = "ft_audio_duration"
    static let MESSAGE_IS_READ_ENTRY = "is_read"
    static let MESSAGE_IS_SENT_ENTRY = "is_sent"   // 0:received, 1:send
    static let MESSAGE_CALL_PRIORITY = "call_priority" //ModelContants.CallPriority
    static let MESSAGE_CALL_TYPE = "call_type" //ModelConstants.CallType
    static let MESSAGE_TYPE = "type"   //Message.Type
}

enum ContactsDBTables {
    static let CONTACTS = "contacts"
    static let GROUPS = "groups"
    static let ADHOCGROUPS = "adhoc_groups"
    static let CONTACT_RELATION = "contact_relation"
    static let DATA = "data"
    static let GKTP = "gktp"
}

enum DataColumns {
    static let ID = "id"
    static let GROUP_ID = "group_id"
    static let CONTACT_ID = "contact_id"
    static let DATATYPE = "datatype"
    static let DATA1 = "data1"
    static let DATA2 = "data2"
    static let DATA3 = "data3"
    static let DATA4 = "data4"
    static let DATA5 = "data5"
    static let DATA6 = "data6"
    static let DATA7 = "data7"
    static let DATA8 = "data8"
    static let DATA9 = "data9"
    static let DATA10 = "data10"
    static let DATA11 = "data11"
    static let DATA12 = "data12"
    static let DATA13 = "data13"
    static let DATA14 = "data14"
    static let DATA15 = "data15"
}

enum GKTPColumns {
    static let GROUP_ID = "group_id"
    static let SEL = "sel"
    static let TYPE = "type"
    static let GKTP_ID = "id"
    static let GKTP_VALUE = "value"
}

enum DataType {
    static let IMESSAGE = "imessage"
}

enum ContactsColumns {
    static let ID = "id"
    static let URI = "uri"
    static let USER_ID = "user_id"
    static let DISPLAY_NAME = "display_name"
    static let EMAIL = "email"
    static let ON_REQUIRED = "on_required"
    static let USER_PRIORITY = "user_priority"
    static let OFF_USER_INFO_ID = "off_user_info_id"
    static let PARTICIPANT_TYPE = "participant_type"
    static let ON_RECVONLY = "on_recvonly"
    static let ORGANIZATION = "organization"
    static let GROUP_INFO = "group_info"
    static let IS_PROFILE = "is_profile"
    static let SEARCH_KEY = "search_key"
    static let LIST_LABEL = "list_label"
    static let TYPE = "type"
}

enum GroupsColumns {
    static let ID = "id"
    static let URI = "uri"
    static let GROUP_ID = "group_id"
    static let DISPLAY_NAME = "display_name"
    static let ON_INVITE_MEMBERS = "on_invite_members"
    static let ON_MAX_PARTICIPANT = "on_max_participant"
    static let ALLOW_EMERGENCY_CALL = "allow_emergency_call"
    static let ALLOW_IMMINENT_CALL = "allow_imminent_call"
    static let ALLOW_EMERGENCY_ALERT = "allow_emergency_alert"
    static let ON_ALLOW_GET_MEMBER_LIST = "on_allow_get_member_list"
    static let ON_ALLOW_GET_AFFILIATION_LIST = "on_allow_get_affiliation_list"
    static let ON_DISABLED = "on_disabled"
    static let ON_NETWORK_GROUP_PRIORITY = "on_network_group_priority"
    static let OFF_PROSE_LAYER2_GROUP_ID = "off_prose_layer2_group_id"
    static let OFF_IP_MULTICAST_ADDRESS = "off_ip_multicast_address"
    static let OFF_PDN_TYPE = "off_pdn_type"
    static let OFF_PROSE_SIG_PPPP = "off_prose_sig_pppp"
    static let OFF_PROSE_EMERGENCY_SIG_PPPP = "off_prose_emergency_sig_pppp"
    static let OFF_PROSE_IMMINENT_SIG_PPPP = "off_prose_imminent_sig_pppp"
    static let OFF_PROSE_MEDIA_PPPP = "off_prose_media_pppp"
    static let OFF_PROSE_EMERGENCY_MEDIA_PPPP = "off_prose_emergency_media_pppp"
    static let OFF_PROSE_IMMINENT_MEDIA_PPPP = "off_prose_imminent_media_pppp"
    static let OFF_PROSE_RELAY_SERVICE_CODE = "off_prose_relay_service_code"
    static let OWNER = "owner"
    static let LEVEL_WI_GROUP_HIERARCHY = "level_wi_group_hierarchy"
    static let LEVEL_WI_USER_HIERARCHY = "level_wi_user_hierarchy"
    static let ON_PROGRESS_EMERGENCY_CANCEL_TIMEOUT = "on_progress_emergency_cancel_timeout"
    static let ON_PROGRESS_IMMINENT_CANCEL_TIMEOUT = "on_progress_imminent_cancel_timeout"
    static let OFF_PROGRESS_EMERGENCY_CANCEL_TIMEOUT = "off_progress_emergency_cancel_timeout"
    static let OFF_PROGRESS_IMMINENT_CANCEL_TIMEOUT = "off_progress_imminent_cancel_timeout"
    static let ON_HANG_TIMER = "on_hang_timer"
    static let ON_MAX_DURATION = "on_max_duration"
    static let OFF_HANG_TIMER = "off_hang_timer"
    static let OFF_MAX_DURATION = "off_max_duration"
    static let ON_MIN_NUM_START = "on_min_num_start"
    static let ON_TIMEOUT_ACK_REQ_MEMBER = "on_timeout_ack_req_member"
    static let ON_ACTION_EXP_TIMEOUT_ACK_REQ_MEMBER = "on_action_exp_timeout_ack_req_member"
    static let GROUP_KEY_TRANSPORT_PAYLOAD = "group_key_transport_payload"
    static let PROTECT_MEDIA = "protect_media"
    static let PROTECT_FLOOR_CONTROL_SIG = "protect_floor_control_sig"
    static let REQUIRE_MULTICAST_FLOOR_CONTROL_SIG = "require_multicast_floor_control_sig"
    static let ON_ACK_CALL_AREA = "on_ack_call_area"
    static let ON_PREEMPTION_CAPA = "on_preemption_capa"
    static let ON_PREEMPTED_CAPA = "on_preempted_capa"
    static let ON_GROUP_FLOOR_CONTROL_SECURITY = "on_group_floor_control_security"
    static let MBMS_SERVICE_AREA = "mbms_service_area"
    static let RECORDER_USER_ID = "recorder_user_id"
    static let MEMBER_COUNT = "member_count"
    static let PROFILE_USER_PRIORITY = "profile_user_priority"
    static let MCPTT_EMERGENCY_GROUP = "mcptt_emergency_group"
    static let SEARCH_KEY = "search_key"
    static let GROUP_ETAG = "group_eTag"
    static let ALLOW_MODIFY = "allow_modify"
    static let TYPE = "type"
}

enum AdhocGroupsColumns {
    static let ID = "id"
    static let URI = "uri"
    static let ALLOW_MODIFY = "allow_modify"
    static let DISPLAY_NAME = "display_name"
    static let MEMBER_URIS = "member_uris"
}

enum ContactRelationColumns {
    static let ID = "id"
    static let CONTACT_ID = "contact_id"
    static let GROUP_ID = "group_id"
}

class DatabaseConstants {
    //Create message db table
    static let createMessageDatabaseTable = "\(LocalDBTables.MESSAGE_DATABASE_TABLE) ( \(MessageColumns.MESSAGE_ID_ENTRY) INTEGER PRIMARY KEY AUTOINCREMENT, \(MessageColumns.MESSAGE_USER_URI) TEXT,\(MessageColumns.MESSAGE_CHANNEL_URI_ENTRY) TEXT, \(MessageColumns.MESSAGE_SESSION_ID_ENTRY) INTEGER,\(MessageColumns.MESSAGE_SENDER_URI_ENTRY) TEXT,\(MessageColumns.MESSAGE_START_TIME) INTEGER, \(MessageColumns.MESSAGE_END_TIME) INTEGER,\(MessageColumns.MESSAGE_IM_BODY_ENTRY) TEXT,\(MessageColumns.MESSAGE_IS_SITUATION_ENTRY) INTEGER,\(MessageColumns.MESSAGE_FT_THUMBNAIL_KEY_ENTRY) TEXT,\(MessageColumns.MESSAGE_FT_URI_ENTRY) TEXT, \(MessageColumns.MESSAGE_FT_STATE_ENTRY) INTEGER, \( MessageColumns.MESSAGE_FT_AUDIO_DURATION_ENTRY) TEXT, \(MessageColumns.MESSAGE_TYPE) INTEGER, \(MessageColumns.MESSAGE_IS_READ_ENTRY) INTEGER, \(MessageColumns.MESSAGE_CALL_TYPE), INTEGER, \(MessageColumns.MESSAGE_CALL_PRIORITY)INTEGER, \( MessageColumns.MESSAGE_IS_SENT_ENTRY)INTEGER )"

    // Create contact db table
    static let createContactTable = "\(ContactsDBTables.CONTACTS)( \(ContactsColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT,\(ContactsColumns.URI) TEXT, \(ContactsColumns.USER_ID) TEXT, \(ContactsColumns.DISPLAY_NAME) TEXT,\(ContactsColumns.EMAIL) TEXT,\(ContactsColumns.ON_REQUIRED)INTEGER, \(ContactsColumns.USER_PRIORITY) INTEGER,\(ContactsColumns.OFF_USER_INFO_ID)TEXT,\(ContactsColumns.PARTICIPANT_TYPE) TEXT,\(ContactsColumns.ON_RECVONLY) INTEGER,\(ContactsColumns.ORGANIZATION) TEXT, \(ContactsColumns.GROUP_INFO) TEXT, \(ContactsColumns.IS_PROFILE) INTEGER, \(ContactsColumns.SEARCH_KEY) TEXT, \(ContactsColumns.LIST_LABEL) TEXT, \(ContactsColumns.TYPE) TEXT )"

    //  Create group table
    static let createGroupTable = "\(ContactsDBTables.GROUPS) ( \(GroupsColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT, \(GroupsColumns.URI) TEXT, \(GroupsColumns.GROUP_ID) TEXT,\(GroupsColumns.DISPLAY_NAME) TEXT, \(GroupsColumns.ON_INVITE_MEMBERS) INTEGER, \(GroupsColumns.ON_MAX_PARTICIPANT) INTEGER, \(GroupsColumns.ALLOW_EMERGENCY_CALL) INTEGER, \(GroupsColumns.ALLOW_IMMINENT_CALL) INTEGER,\(GroupsColumns.ALLOW_EMERGENCY_ALERT) INTEGER, \(GroupsColumns.ON_ALLOW_GET_MEMBER_LIST) INTEGER, \(GroupsColumns.ON_ALLOW_GET_AFFILIATION_LIST) INTEGER, \(GroupsColumns.ON_DISABLED) INTEGER , \(GroupsColumns.ON_NETWORK_GROUP_PRIORITY) INTEGER, \(GroupsColumns.OFF_PROSE_LAYER2_GROUP_ID) TEXT, \(GroupsColumns.OFF_IP_MULTICAST_ADDRESS) TEXT , \(GroupsColumns.OFF_PDN_TYPE) TEXT,\(GroupsColumns.OFF_PROSE_SIG_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_EMERGENCY_SIG_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_IMMINENT_SIG_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_MEDIA_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_EMERGENCY_MEDIA_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_IMMINENT_MEDIA_PPPP) INTEGER, \(GroupsColumns.OFF_PROSE_RELAY_SERVICE_CODE) TEXT, \(GroupsColumns.OWNER) TEXT, \(GroupsColumns.LEVEL_WI_GROUP_HIERARCHY) INTEGER, \(GroupsColumns.LEVEL_WI_USER_HIERARCHY) INTEGER, \(GroupsColumns.ON_PROGRESS_EMERGENCY_CANCEL_TIMEOUT) INTEGER, \(GroupsColumns.ON_PROGRESS_IMMINENT_CANCEL_TIMEOUT) INTEGER, \(GroupsColumns.OFF_PROGRESS_EMERGENCY_CANCEL_TIMEOUT) INTEGER, \(GroupsColumns.OFF_PROGRESS_IMMINENT_CANCEL_TIMEOUT) INTEGER, \(GroupsColumns.ON_HANG_TIMER) INTEGER, \(GroupsColumns.ON_MAX_DURATION) INTEGER, \(GroupsColumns.OFF_HANG_TIMER) INTEGER, \(GroupsColumns.OFF_MAX_DURATION) INTEGER, \(GroupsColumns.ON_MIN_NUM_START) INTEGER, \(GroupsColumns.ON_TIMEOUT_ACK_REQ_MEMBER) INTEGER, \(GroupsColumns.ON_ACTION_EXP_TIMEOUT_ACK_REQ_MEMBER) INTEGER, \(GroupsColumns.GROUP_KEY_TRANSPORT_PAYLOAD) TEXT, \(GroupsColumns.PROTECT_MEDIA) TEXT, \(GroupsColumns.PROTECT_FLOOR_CONTROL_SIG) TEXT, \(GroupsColumns.REQUIRE_MULTICAST_FLOOR_CONTROL_SIG) TEXT, \(GroupsColumns.ON_ACK_CALL_AREA) INTEGER,\(GroupsColumns.ON_PREEMPTION_CAPA) TEXT, \(GroupsColumns.ON_PREEMPTED_CAPA) TEXT, \(GroupsColumns.ON_GROUP_FLOOR_CONTROL_SECURITY) TEXT, \(GroupsColumns.MBMS_SERVICE_AREA) INTEGER, \(GroupsColumns.RECORDER_USER_ID) TEXT, \( GroupsColumns.MEMBER_COUNT) TEXT, \(GroupsColumns.PROFILE_USER_PRIORITY) INTEGER, \(GroupsColumns.MCPTT_EMERGENCY_GROUP) INTEGER, \(GroupsColumns.SEARCH_KEY) TEXT, \(GroupsColumns.GROUP_ETAG) TEXT, \(GroupsColumns.ALLOW_MODIFY) INTEGER, \(GroupsColumns.TYPE) TEXT )"

    //  Create contact relation table
    static let createContactRelationTable = "\(ContactsDBTables.CONTACT_RELATION) ( \(ContactRelationColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT, \(ContactRelationColumns.CONTACT_ID) INTEGER, \(ContactRelationColumns.GROUP_ID) INTEGER )"

    // Create data table
    static let createDataTable = "\(ContactsDBTables.DATA) ( \(DataColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT, \(DataColumns.GROUP_ID) TEXT, \(DataColumns.CONTACT_ID) INTEGER, \(DataColumns.DATATYPE) TEXT, \(DataColumns.DATA1) TEXT, \(DataColumns.DATA2) TEXT,\(DataColumns.DATA3) TEXT,\(DataColumns.DATA4) TEXT,\(DataColumns.DATA5) TEXT,\(DataColumns.DATA6) TEXT,\(DataColumns.DATA7) TEXT,\(DataColumns.DATA8) TEXT,\(DataColumns.DATA9) TEXT,\(DataColumns.DATA10) TEXT,\(DataColumns.DATA11) TEXT,\(DataColumns.DATA12) TEXT,\(DataColumns.DATA13) TEXT,\(DataColumns.DATA14) TEXT,\(DataColumns.DATA15) TEXT)"

    // Create GKTP table
    static let createGKTPTable = "\(ContactsDBTables.GKTP) ( \(GKTPColumns.GROUP_ID) TEXT, \(GKTPColumns.SEL) TEXT, \(GKTPColumns.TYPE) TEXT, \(GKTPColumns.GKTP_ID) TEXT, \(GKTPColumns.GKTP_VALUE) TEXT)"

    // Create Adhoc table
    static let createAdhocTable = "\(ContactsDBTables.ADHOCGROUPS) ( \(AdhocGroupsColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT, \(AdhocGroupsColumns.URI)  TEXT, \(AdhocGroupsColumns.DISPLAY_NAME)  TEXT, \(AdhocGroupsColumns.ALLOW_MODIFY)  INTEGER, \(AdhocGroupsColumns.MEMBER_URIS)  TEXT )"

    // TBD: Need confirmation on it before porting it in swift
    //public interface ContactTablesUris {
    //    Uri CONTACTS_CONTENT_URI = Uri.parse("content://com.samsung.android.sptt.contacts");
    //    Uri CONTACTS_CONTACTS_CONTENT_URI = Uri.parse("content://com.samsung.android.sptt.contacts/contacts");
    //    Uri CONTACTS_GROUPS_CONTENT_URI = Uri.parse("content://com.samsung.android.sptt.contacts/groups");
    //}

}
