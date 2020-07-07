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
    private let validator: FieldValidator = FieldValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func revisionTextField()  {
       
        let emailIsOk: Bool = validator.isValidEmail(emailTextField.text!)
        let passwordIsOk: Bool = validator.isValidPassword(passwordTextField.text!)
        
        guard emailIsOk == true else {
            pushAlert("Поле E-mail должно быть заполнено корректно.")
            return
        }
        guard passwordIsOk == true else {
            pushAlert("Пароль должен состоять из 8-50 символов включительно, содержать 1 цифру, 1 специальный символ и 1 заглавную букву.")
            return
        }

        print("ok")


    }
    
    func pushAlert(_ rules: String){
        let alert = UIAlertController(title: "Поверьте правильность ввода данных", message: rules, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
