//
//  NewsletterViewController.swift
//  NewApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import UIKit
import CommonApp

class NewsletterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NewApp"
        
        // MARK: - recover model
        IntegrationLayer_recoverModel(identifier: "OldNewsletterManager") { instance in
            
            if let newsletterManager = instance as? CMNewsletterProtocol {
                print(newsletterManager.getNewsletterType(type: "NewApp type"))
            }
            
        } failure: { error in
            print(error)
        }
    }
    
    @IBAction func closeModalButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
