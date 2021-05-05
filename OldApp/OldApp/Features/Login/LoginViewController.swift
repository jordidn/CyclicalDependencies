//
//  LoginViewController.swift
//  OldApp
//
//  Created by Jordi Duran Ortega on 29/04/2021.
//

import UIKit
import CommonApp


class LoginViewController: UIViewController, CMLoginProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    // MARK: - IBActions
    
    @IBAction func openNewsletterButtonAction(_ sender: Any) {
        IntegrationLayer_recoverViewController(identifier: "Newsletter") { viewController in
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    // MARK: - Properties
    
    private var types: [CMLoginType]?
    private var loginModel: CMLoginModel?
    
    
    // MARK: - LifecycleMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPropertiesToStackViewIfNeeded()
    }
    
    
    // MARK: - Private methods
    
    private func addPropertiesToStackViewIfNeeded() {
        self.title = types != nil || loginModel != nil ? "NewApp" : "OldApp"
        
        // Login Types
        let textLabel = UILabel()
        textLabel.text = "LoginTypes: \(types?.map({ $0.rawValue }).joined(separator: ", ") ?? "nil")"
        textLabel.textAlignment = .center
        
        self.stackView.addArrangedSubview(textLabel)
    }
    
    
    // MARK: - CMLoginProtocol implementation
    
    func setLoginTypes(types: [CMLoginType]) {
        self.types = types
    }
    
    func setLoginData(loginModel: CMLoginModel) {
        self.loginModel = loginModel
    }
    
}
