//
//  LoginViewController.swift
//  testNews
//
//  Created by Jernard Ducon on 4/02/21.
//

import UIKit

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    var presenter: LoginPresenterProtocol?

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setup(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    private func checkUserField() -> Bool {
        guard let user = userTextField.text else { return false }
        var test = false
        
        if user.isEmpty {
            test = true
        }
        
        return test
    }
    
    private func checkPasswordField() -> Bool {
        guard let pass = passwordTextField.text else { return false }
        var test = false
        
        if pass.isEmpty {
            test = true
        }
        
        return test
    }
    
    private func tryToLogin() {
        if !checkUserField() && !checkPasswordField() {
            guard let user = userTextField.text else { return }
            guard let pass = passwordTextField.text else { return }
            
            self.presenter?.requestLogin(user: user, password: pass)
        }
    }
    
    @IBAction func loginDidPressed(_ sender: Any) {
        tryToLogin()
    }
}
