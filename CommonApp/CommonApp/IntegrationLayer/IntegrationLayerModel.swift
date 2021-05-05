//
//  IntegrationLayerModel.swift
//  CommonApp
//
//  Created by Jordi Duran Ortega on 05/05/2021.
//

import Foundation

// MARK: - Models Management

/// Model format: "projectName.className"
public func IntegrationLayer_register(model: String, identifier: String) {
    let model = ILModel(modelIdentifier: model, identifier: identifier)
    IntegrationLayer.shared.addModel(model: model)
}

public func IntegrationLayer_recoverModel(identifier: String, success: (NSObject) -> Void, failure: ((Error) -> Void)? = nil) {
    guard let model = IntegrationLayer.shared.getModel(byIdentifier: identifier) else {
        failure?(CommonError.modelNotExists)
        return
    }
    
    guard let instance = model.object else {
        failure?(CommonError.modelIdentifierNotExists)
        return
    }
    
    success(instance)
}



// MARK: - Integration Layer model

struct ILModel {
    let modelIdentifier: String
    let identifier: String
    
    var object: NSObject? {
        guard let classType = NSClassFromString(modelIdentifier) as? NSObject.Type else { return nil }
        return classType.init()
    }
}
