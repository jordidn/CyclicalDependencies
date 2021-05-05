//
//  ViewController.swift
//  OldApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import UIKit
import CommonApp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "OldApp"
    }

    @IBAction func openNewAppButtonAction(_ sender: Any) {
        IntegrationLayer_recoverViewController(identifier: "NewAppScreen") { viewController in
            self.navigationController?.pushViewController(viewController, animated: true)
            
        } failure: { error in
            print(error)
        }
    }
    
    @IBAction func openLoginButtonAction(_ sender: Any) {
        IntegrationLayer_recoverViewController(identifier: "Login") { viewController in
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

