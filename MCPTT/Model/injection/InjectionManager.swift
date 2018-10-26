//
//  InjectorManager.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

class InjectionManager {
    static let shared = InjectionManager()
    private var injector: Injector

    private init() {
        self.injector = Injector()
    }

    func createChannel(pttUrl: PttUrl) -> Channel1 {
        return injector.creatChannel(for: pttUrl)
    }
    
    func createGroupContact(pttUrl: PttUrl) -> GroupContact {
        return injector.createGroupContact(pttUrl: pttUrl)
    }
    
    func createPrivateContact(pttUrl: PttUrl) -> PrivateContact {
        return injector.createPrivateContact(pttUrl: pttUrl)
    }
    
    // TODO: Implement other method.
}
