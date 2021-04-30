//
//  OldAppIntegrationLayer.swift
//  OldApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import UIKit
import CommonApp


public class OldAppIntegrationLayer: IntegrationLayerProtocol {
    
    private static let bundle = Bundle(for: OldAppIntegrationLayer.self)
    
    public static func registerControllers() {
        // Register Login ViewController
        IntegrationLayer_registerViewController(storyboard: UIStoryboard(name: "LoginStoryboard", bundle: bundle),
                                                viewControllerIdentifier: "LoginViewController",
                                                identifier: "Login")
    }
    
}
