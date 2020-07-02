//
//  LoginViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 30.06.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        revisionTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func revisionTextField()  {
        //print(emailTextField.text ?? "none",passwordTextField.text ?? "none")
        
        //print(isValidEmail(emailTextField.text!))
        //print(isEmailLenghtOk(emailTextField.text!))
        //print(isValidPassword(passwordTextField.text!))

    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,5}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isEmailLenghtOk(_ email: String) -> Bool {
        if email.count > 0 && email.count<=250  {
            return true
        } else{
           return false
        }
    }
    func isValidPassword(_ password : String) -> Bool{
        let predicate = NSPredicate(format: "SELF MATCHES %@","^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8,50}$")

        return predicate.evaluate(with: password)
    }

}
