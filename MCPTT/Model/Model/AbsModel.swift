//
//  IModel.swift
//  MCPTT
//
//  Created by Niranjan, Rajabhaiya on 25/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation

protocol Model {
    func addDelegate(delegate: Any)
    func removeDelegate(delegate: Any)
}

// TODO: Need to work on this class once Model Mediator done 
class AbsModel: Model {
    func addDelegate(delegate: Any) {
        
    }
    
    func removeDelegate(delegate: Any) {
        
    }
    
    private var controllerListener: ModelMediator
    
    init(controlListener: ModelMediator) {
        self.controllerListener = controlListener
    }
    
    func getControlListener() -> ModelMediator {
        return controllerListener
    }
}
