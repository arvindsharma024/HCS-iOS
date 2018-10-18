//
//  ContactsDatabaseController.swift
//  MCPTT
//
//  Created by Vinayak Naik on 18/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ContactsDatabaseController: DatabaseController {
    
    static let contactDbHelperShared = ContactDatabaseHelper()
    
    //MARK: - Insert Contact data
    public func insertContactToDb( contactQuery: String ){

        self.insert(query: contactQuery)
    }
    
    public func insertGroupContactToDb( groupContactQuery: String ){
        self.insert(query: groupContactQuery)
    }
    
    public func insertAdhocContactToDb( adHocContactQuery: String ){
        self.insert(query: adHocContactQuery)
    }
    
    //MARK: - Get Contact data
}
