//
//  IntegrationLayer.swift
//  CommonApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import Foundation
import UIKit


// MARK: - IntegrationLayer protocol

public protocol IntegrationLayerProtocol: class {
    static func registerControllers()
}



// MARK: - ViewController Management

public func IntegrationLayer_registerViewController(storyboard: UIStoryboard, viewControllerIdentifier: String, identifier: String) {
    let controller = ILController(storyboard: storyboard, viewControllerIdentifier: viewControllerIdentifier, identifier: identifier)
    IntegrationLayer.shared.addController(controller: controller)
}

public func IntegrationLayer_recoverViewController(identifier: String, success: (UIViewController) -> Void, failure: ((Error) -> Void)? = nil) {
    guard let controller = IntegrationLayer.shared.getController(byIdentifier: identifier) else {
        failure?(CommonError.controllerNotExists)
        return
    }
    
    guard let viewController = controller.viewControler else {
        failure?(CommonError.viewControllerIdentifierNotExists)
        return
    }
    
    success(viewController)
}



// MARK: - Models Management

/// Model format: "projectName.className"
public func IntegrationLayer_register(model: String, identifier: String) {
    let model = ILModel(modelIdentifier: model, identifier: identifier)
    IntegrationLayer.shared.addModel(model: model)
}

public func IntegrationLayer_recoverModel(identifier: String, success: (AnyClass) -> Void, failure: ((Error) -> Void)? = nil) {
    guard let model = IntegrationLayer.shared.getModel(byIdentifier: identifier) else {
        failure?(CommonError.modelNotExists)
        return
    }
    
    guard let modelClass = model.modelClass else {
        failure?(CommonError.modelIdentifierNotExists)
        return
    }
    
    success(modelClass)
}



// MARK: - Errors

public enum CommonError: Error {
    case controllerNotExists
    case viewControllerIdentifierNotExists
    
    case modelNotExists
    case modelIdentifierNotExists
}



// MARK: - Internal classes

internal class IntegrationLayer {
    
    static let shared = IntegrationLayer()
    
    private var controllers: [ILController] = []
    private var models: [ILModel] = []
    
    
    // MARK: - Controllers
    
    func addController(controller: ILController) {
        controllers.append(controller)
    }
    
    func getController(byIdentifier identifier: String) -> ILController? {
        return controllers.first(where: { $0.identifier == identifier })
    }
    
    
    // MARK: - Models
    
    func addModel(model: ILModel) {
        models.append(model)
    }
    
    func getModel(byIdentifier identifier: String) -> ILModel? {
        return models.first(where: { $0.identifier == identifier })
    }
    
}



// MARK: - Integration Layer models

internal struct ILController {
    let storyboard: UIStoryboard
    let viewControllerIdentifier: String
    let identifier: String
    
    var viewControler: UIViewController? {
        return storyboard.instantiateViewController(identifier: viewControllerIdentifier)
    }
}

internal struct ILModel {
    let modelIdentifier: String
    let identifier: String
    
    var modelClass: AnyClass? {
        return NSClassFromString(modelIdentifier)
    }
}
