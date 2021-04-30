//
//  NewAppIntegrationLayer.swift
//  NewApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import Foundation
import CommonApp

public class NewAppIntegrationLayer: IntegrationLayerProtocol {
    
    private static let bundle = Bundle(for: NewAppIntegrationLayer.self)
    
    public static func registerControllers() {
        // Register Main ViewController
        IntegrationLayer_registerViewController(storyboard: UIStoryboard(name: "NewAppScreenStoryboard", bundle: bundle),
                                                viewControllerIdentifier: "NewAppScreenViewController",
                                                identifier: "NewAppScreen")
        
        // Register Newsletter ViewController
        IntegrationLayer_registerViewController(storyboard: UIStoryboard(name: "NewsletterStoryboard", bundle: bundle),
                                                viewControllerIdentifier: "NewsletterViewController",
                                                identifier: "Newsletter")
        
        // Register NewsletterManager Model
        IntegrationLayer_register(model: "NewApp.NewsletterManager", identifier: "NewAppNewsletterManager")
    }
    
}
