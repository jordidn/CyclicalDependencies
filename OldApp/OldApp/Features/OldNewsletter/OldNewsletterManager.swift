//
//  OldNewsletterManager.swift
//  OldApp
//
//  Created by Jordi Duran Ortega on 05/05/2021.
//

import Foundation
import CommonApp

public class OldNewsletterManager: NSObject, CMNewsletterProtocol {
    
    public func getNewsletterType(type: String) -> String {
        return "OldApp Registered"
    }
    
}
