//
//  LoginViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 30.06.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    weak var delegateController: LoginViewControllerDelegate?

    private let validator: FieldValidator = FieldValidator()
    private let wrongPasswordInfo: String = "Пароль должен состоять из 8-50 символов включительно, содержать 1 цифру, 1 специальный символ и 1 заглавную букву."
    private let wrongEmailInfo: String = "Поле E-mail должно быть заполнено корректно."
    private let titleTextForAlert: String = "Поверьте правильность ввода данных"
    
    @IBAction func loginButton(_ sender: UIButton) {
        validateTextFields()
    }
    
    func validateTextFields()  {
        let isEmailValid: Bool = validator.isEmailValid(emailTextField.text!)
        let isPasswordValid: Bool = validator.isPasswordValid(passwordTextField.text!)
        
        guard isEmailValid == true else {
            pushAlert(wrongEmailInfo)
            return
        }
        guard isPasswordValid == true else {
            pushAlert(wrongPasswordInfo)
            return
        }
        delegateController?.goToMainScreen()
    }
    func pushAlert(_ rules: String) {
        let alert = UIAlertController(title: titleTextForAlert, message: rules, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func completeLoginFlowSuccess() {
        let mainNavigationController = self.navigationController
        let mainTabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AppMainScreen")
        mainNavigationController?.viewControllers = [mainTabBarViewController]
    }
}
protocol LoginViewControllerDelegate: class {
    func goToMainScreen()
}
