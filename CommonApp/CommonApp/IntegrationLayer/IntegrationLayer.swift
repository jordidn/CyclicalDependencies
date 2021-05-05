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



// MARK: - Errors

public enum CommonError: Error {
    case controllerNotExists
    case viewControllerIdentifierNotExists
    
    case modelNotExists
    case modelIdentifierNotExists
}
