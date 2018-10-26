//
//  ProvisionConstant.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 25/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class ProvisionContactItem {
    
    var mcpttId: String
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var orgName: String = ""
    
    init(mcpttId: String, firstName: String, lastName: String, email: String, orgName: String) {
        self.mcpttId = mcpttId
        self.firstName = firstName
        self.lastName = firstName
        self.email = email
        self.orgName = email
    }
    
    func getFullName() -> String {
        if !firstName.isEmpty && !lastName.isEmpty {
            return "\(firstName) \" \" \(lastName)"
        } else {
            return firstName + lastName
        }
    }
}
