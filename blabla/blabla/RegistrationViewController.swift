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
    
    #warning("All IBOutlets should be private")
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var secondNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    #warning("Need check comments from previos class. Also wrong name of the function(notCamelCaseRule)")
    @IBAction func JoinButtonAction(_ sender: UIButton) {
        revisionTextField()
    }
    
    #warning("Empty func. We could delete it.")
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func revisionTextField() {
        
        #warning("Should rename constants "isSomethingValid"")
        let nameIsOk: Bool = validator.isValidName(nameField.text!)
        let secondNameIsOk: Bool = validator.isValidSecondName(secondNameField.text!)
        let emailIsOk: Bool = validator.isValidEmail(emailField.text!)
        let passwordIsOk: Bool = validator.isValidPassword(passwordField.text!)
        let repeatPasswordIsOk: Bool = validator.isRepeatPasswordCorrect(passwordField.text!, repeatPassword: repeatPasswordField.text!)
        
        guard nameIsOk == true else {
            pushAlert("Имя должно содержать от 5 до 25 символов.")
            return
        }
        
        guard secondNameIsOk == true else {
            pushAlert("Фамилия должно содержать от 2 до 40 символов.")
            return
        }
        
        guard emailIsOk == true else {
            pushAlert("Поле E-mail должно быть заполнено корректно.")
            return
        }
        
        guard passwordIsOk == true else {
            pushAlert("Пароль должен состоять из 8-50 символов включительно, содержать 1 цифру, 1 специальный символ и 1 заглавную букву.")
            return
        }
        
        guard repeatPasswordIsOk == true else {
            pushAlert("Введенные пароли не совпадают")
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
