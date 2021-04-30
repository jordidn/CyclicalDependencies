//
//  NewAppScreenViewController.swift
//  NewApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import Foundation
import CommonApp

class NewAppScreenViewController: UIViewController {

    @IBAction func openOldAppProcessButtonAction(_ sender: Any) {
        // Login only Exists in 'OldApp'
        IntegrationLayer_recoverViewController(identifier: "Login") { viewController in
            
            if let loginViewController = viewController as? CMLoginProtocol {
                let loginModel = CMLoginModel(username: "Nombre Apellido", mail: "nombreApellido@gmail.com")
                loginViewController.setLoginData(loginModel: loginModel)
                
                loginViewController.setLoginTypes(types: CMLoginType.allCases)
            }
            
            let navController = UINavigationController(rootViewController: viewController)
            self.present(navController, animated: true)
            
        } failure: { error in
            print(error)
        }
    }
    
}
