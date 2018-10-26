//
//  Injector.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class Injector {
    
    func creatChannel(for pttUrl: PttUrl) -> Channel1 {
        return Channel1.init(pttUrl: pttUrl)
    }
    
    func  createGroupContact(pttUrl: PttUrl) -> GroupContact {
        return GroupContact.init(pttUrl: pttUrl)
    }
    
    func createPrivateContact(pttUrl: PttUrl) -> PrivateContact {
        return PrivateContact.init(pttUrl: pttUrl)
    }
    //TODO: Add more method once the other file implementation is done
    //func createGroupContact(for pttUrl: PttUrl) ->
}
