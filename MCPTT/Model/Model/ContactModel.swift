//
//  ContactModel.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 25/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol ContactModelDelegate: AnyObject {
    func onPresenceUpdated(contact: PrivateContact)
    func onResponseProvisionContact(provisionContactItemlist: [ProvisionContactItem])
}

protocol ContactModelProtocol {
    func getContact(for pttUrl: PttUrl) -> Contact1
    func fetchContacts()
    func getLabelContact(name: String) -> PrivateContact
    func registerPrivateContact(for pttUrl: PttUrl, email: String, name: String, organization: String)
    func unRegisterPrivateContact(pttUrl: PttUrl)
    func modifyPrivateContact(pttUrl: PttUrl, newName: String)
    func registerDefaultGroupContact()
    func getPresence(for pttUrls: [PttUrl])
    func getPresence(for pttUrl: PttUrl)
    func updatePresence(for pttUrl: PttUrl, presence: PrivateContact.Presence)
    func setPresence(presence: PrivateContact.Presence)
    func requestProvisionContact(firstName: String, lastName: String, email: String)
}
class ContactModel: AbsModel, ContactModelProtocol {
 
    enum eventType {
        case handlePresenceUpdate
        case handleProvisionContactFetchComplete
    }
    
    private static let tag: String = "ContactModel"
    weak var delegate: ContactModelDelegate?
    
    init(controler: ModelMediator) {
        super.init(controlListener: controler)
        //self.delegate = delegate
    }
    
    func getContact(for pttUrl: PttUrl) -> Contact1 {
        //
        //var contact: ContactsDatabaseController.g
        
        return InjectionManager.shared.createPrivateContact(pttUrl: pttUrl)
    }
    
    func fetchContacts() {
        // TODO: need to implement ModelMediator
        //getControlListener()
    }
    
    func getLabelContact(name: String) -> PrivateContact {
        let contact = InjectionManager.shared.createPrivateContact(pttUrl: PttUrl.init(urls: ""))
        contact.setName(name: name)
        return contact
    }
    
    func registerPrivateContact(for pttUrl: PttUrl, email: String, name: String, organization: String) {
        let contact = InjectionManager.shared.createPrivateContact(pttUrl: pttUrl)
        contact.setName(name: name)
        contact.contactType = ContactType.XDM
        contact.setOrganization(organization: organization)
        contact.email = email
       // contact.
        // TODO: Need to call here modelMediator method
    }
    
    func unRegisterPrivateContact(pttUrl: PttUrl) {
        let contact = InjectionManager.shared.createPrivateContact(pttUrl: pttUrl)
        contact.contactType = ContactType.XDM
        // TODO: Need to call here modelMediator method\
    }
    
    func modifyPrivateContact(pttUrl: PttUrl, newName: String) {
        let contact = InjectionManager.shared.createPrivateContact(pttUrl: pttUrl)
        contact.contactType = ContactType.XDM
        // TODO: Need to call here modelMediator method\
    }
    
    func registerDefaultGroupContact() {
        // TODO: Need to call here modelMediator method\
    }
    
    func getPresence(for pttUrl: PttUrl) {
        // TODO: Need to call here modelMediator method\
    }
    
    func getPresence(for pttUrls: [PttUrl]) {
        // TODO: Need to call here modelMediator method\
    }
    
    func updatePresence(for pttUrl: PttUrl, presence: PrivateContact.Presence) {
        let contact = getContact(for: pttUrl) as? PrivateContact
        contact?.presence = presence
        // TODO: Need to invoke listener here
    }
    
    func setPresence(presence: PrivateContact.Presence) {
        // TODO: Need to call here modelMediator method\
    }
    
    func requestProvisionContact(firstName: String, lastName: String, email: String) {
        // TODO: Need to call here modelMediator method\
    }
    
    func onResponseProvisionContact(provisionContactItems: [ProvisionContactItem]) {
        
        // TODO: Need to invoke listener here
    }
}
