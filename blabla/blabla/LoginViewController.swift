//
//  LoginViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 30.06.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    #warning("All IBOutlets should be private")
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    #warning("You could create separate extension for actions in your class, or move actions down")
    @IBAction func loginButton(_ sender: UIButton) {
        revisionTextField()
    }
    
    private let validator: FieldValidator = FieldValidator()
    
    #warning("This function does nothing for now. We could remove it")
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    #warning("Could change function name fro example "validateTextFields"")
    func revisionTextField()  {
       
        #warning("would be great if you rename this constants "isEmailValid" and "isPasswordValid"")
        let emailIsOk: Bool = validator.isValidEmail(emailTextField.text!)
        let passwordIsOk: Bool = validator.isValidPassword(passwordTextField.text!)
        
        guard emailIsOk == true else {
            #warning("Great solutions will be to move all static text to the properties of this class for begining.(Best solutions will be create localization file, but it's not for now)")
            pushAlert("Поле E-mail должно быть заполнено корректно.")
            return
        }
        
        guard passwordIsOk == true else {
            pushAlert("Пароль должен состоять из 8-50 символов включительно, содержать 1 цифру, 1 специальный символ и 1 заглавную букву.")
            return
        }

        print("ok")
    }
    
    func pushAlert(_ rules: String) {

        let alert = UIAlertController(title: "Поверьте правильность ввода данных", message: rules, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
