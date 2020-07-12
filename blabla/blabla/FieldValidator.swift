//
//  ValidatorClass.swift
//  blabla
//
//  Created by Dmitriy Mikitenko on 05.07.2020.
//  Copyright © 2020 MedinaFromLondon. All rights reserved.
//

import Foundation

class FieldValidator {
        
    func isValidEmail(_ email: String) -> Bool {
        if email.count > 0 && email.count<=250{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,5}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        } else{
            return false
        }
    }

    func isValidPassword(_ password: String) -> Bool{
        let predicate = NSPredicate(format: "SELF MATCHES %@","^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8,50}$")
        return predicate.evaluate(with: password)
    }
    
    func isValidName(_ name: String) -> Bool {
        if name.count>4 && name.count<=25{
            return true
        } else{
            return false
        }
    }
    
    func isValidSecondName(_ secondName: String) -> Bool {
        if secondName.count>1 && secondName.count<=40{
            return true
        } else{
            return false
        }
    }
    
    func isRepeatPasswordCorrect(_ password: String, repeatPassword: String) -> Bool {
        if repeatPassword == password {
            return true
        } else{
            return false
        }
    }

}

