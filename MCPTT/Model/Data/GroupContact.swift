//
//  GroupContact.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class GroupContact: Contact1, Hashable {
    var hashValue: Int {
        return self.name.hashValue
    }
    
    static func ==(lhs: GroupContact, rhs: GroupContact) -> Bool {
        return lhs.name == rhs.name
    }
    
    private static let defaultTime: String = "Group"

    var isAbleEmergencyAlert: Bool = false
    var isAbleEmergencyCall: Bool = false
    var isAbleImminentCall: Bool = false
    var isAbleModify: Bool = false
    private var members: Set<PrivateContact>
    
    override init(pttUrl: PttUrl) {
        self.members = Set<PrivateContact>()
        super.init(pttUrl: pttUrl)
    }
    
    override func getMemberUriList() -> [String] {
        var memberUrlList = Array<String>()
        memberUrlList = members.map { $0.pttUrl.description() }
        return memberUrlList
    }
    
    override func getTemporaryName() -> String {
        // TODO: Should be hardcoded value for Group. Android they used form R.String.temporaryGroup
        return ""
    }
    
    func addMember(member: PrivateContact) {
        members.insert(member)
    }
    
    func removeMember(member: PrivateContact) {
        members.remove(member)
    }
    
    func getMemberCount() -> Int {
        return members.count
    }

    func getMemberList() -> Array<PrivateContact> {
        let memberList: Array<PrivateContact> = []
        //memberList = members.sorted(by: >)
        return memberList
    }
    
}
