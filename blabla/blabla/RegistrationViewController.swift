//
//  RegistrationViewController.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 12.07.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private let validator = FieldValidator()
    
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var secondNameField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var repeatPasswordField: UITextField!
    
    @IBAction func joinButtonAction(_ sender: UIButton) {
        validateTextFields()
    }
    
    func validateTextFields() {
        
        let isNameValid: Bool = validator.isNameValid(nameField.text!)
        let isSecondNameValid: Bool = validator.isSecondNameValid(secondNameField.text!)
        let isEmailValid: Bool = validator.isEmailValid(emailField.text!)
        let isPasswordValid: Bool = validator.isPasswordValid(passwordField.text!)
        let isRepeatPasswordValid: Bool = validator.isRepeatPasswordValid(passwordField.text!, repeatPassword: repeatPasswordField.text!)
        
        guard isNameValid == true else {
            pushAlert("Имя должно содержать от 5 до 25 символов.")
            return
        }
        guard isSecondNameValid == true else {
            pushAlert("Фамилия должно содержать от 2 до 40 символов.")
            return
        }
        guard isEmailValid == true else {
            pushAlert("Поле E-mail должно быть заполнено корректно.")
            return
        }
        guard isPasswordValid == true else {
            pushAlert("Пароль должен состоять из 8-50 символов включительно, содержать 1 цифру, 1 специальный символ и 1 заглавную букву.")
            return
        }
        guard isRepeatPasswordValid == true else {
            pushAlert("Введенные пароли не совпадают")
            return
        }
        // do something if everything ok
    }
    
    func pushAlert(_ rules: String) {
        let alert = UIAlertController(title: "Поверьте правильность ввода данных", message: rules, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
