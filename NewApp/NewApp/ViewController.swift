//
//  ViewController.swift
//  NewApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import UIKit
import CommonApp

class ViewController: UIViewController {

    @IBAction func openOldAppProcessButtonAction(_ sender: Any) {
        // Login only Exists in 'OldApp'
        IntegrationLayer_recoverViewController(identifier: "Login") { (viewController) in
            self.present(viewController, animated: true)
        } failure: { (error) in
            print(error)
        }
    }
    
}

