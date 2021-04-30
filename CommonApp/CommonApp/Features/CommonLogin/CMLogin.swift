//
//  CMLogin.swift
//  CommonApp
//
//  Created by Jordi Duran Ortega on 30/04/2021.
//

import Foundation

public enum CMLoginType: String, CaseIterable {
    case mail = "mail"
    case facebook = "facebook"
    case gmail = "gmail"
}

public protocol CMLoginProtocol {
    func setLoginTypes(types: [CMLoginType])
    func setLoginData(loginModel: CMLoginModel)
}

public struct CMLoginModel {
    let username: String
    let mail: String
    
    public init(username: String, mail: String) {
        self.username = username
        self.mail = mail
    }
}
