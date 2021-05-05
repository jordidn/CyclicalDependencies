//
//  IntegrationLayerViewController.swift
//  CommonApp
//
//  Created by Jordi Duran Ortega on 05/05/2021.
//

import UIKit

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



// MARK: - Integration Layer model

struct ILController {
    let storyboard: UIStoryboard
    let viewControllerIdentifier: String
    let identifier: String
    
    var viewControler: UIViewController? {
        return storyboard.instantiateViewController(identifier: viewControllerIdentifier)
    }
}
