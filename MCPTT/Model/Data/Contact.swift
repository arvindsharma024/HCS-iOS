//
//  Contact.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 24/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol Contact1Protocol: AnyObject {
    var name: String { get }
    var organization: String { get }
    var pttUrl: PttUrl { get }
    var floorPriority: Int32 { get }
}

class Contact1: Contact1Protocol, Equatable {
    private var id: Int64 = -1
    private var mName: String
    private var mOrganization: String
    private var mPttUrl: PttUrl
    private var mFloorPriority: Int32
    var contactType: ContactType
    var eTag: String

    static func == (lhs: Contact1, rhs: Contact1) -> Bool {
        return lhs.pttUrl == rhs.pttUrl
    }
    
    init(pttUrl: PttUrl) {
        id = -1
        mOrganization = ""
        mPttUrl = pttUrl
        mName = ""
        eTag = ""
        contactType = ContactType.GMS
        mFloorPriority = 0
    }
    
    var name: String {
        if mName.isEmpty {
            return getTemporaryName()
        }
        return mName
    }
    
    var organization: String {
        return mOrganization
    }
    
    var pttUrl: PttUrl {
        return mPttUrl
    }
    
    var floorPriority: Int32 {
        return mFloorPriority
    }
    
    func setName(name: String) {
        mName = name
    }
    
    func setOrganization(organization: String) {
        mOrganization = organization
    }
    
    func setId(id: Int64) {
        self.id = id
    }
    
    func setUrl(url: PttUrl) {
        mPttUrl = url
    }
    
    func setFloorPriority(floorPriority: Int32) {
        mFloorPriority = floorPriority
    }
    
    func setContactType(contactType: String) {
        if contactType == ContactType.GMS.rawValue {
            self.contactType = .GMS
        } else if contactType == ContactType.XDM.rawValue {
            self.contactType = .XDM
        }
    }
    
    func getTemporaryName() -> String {
        print("This method must be overridden")
        return ""
    }
    
    func getMemberUriList() -> [String] {
        print("This method must be overridden")
        return [String]()
    }
}
