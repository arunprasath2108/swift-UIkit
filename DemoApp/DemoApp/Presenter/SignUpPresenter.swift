//
//  SignUpPresenter.swift
//  DemoApp
//
//  Created by arun-pt6232 on 13/03/23.
//

import Foundation

class SignUpPresenter {
    
    let userSignUpUseCase = SignUpUseCase()
    var view: SignUpViewController?
    
    func signUpUser(newUserData: User) {
        
        userSignUpUseCase.userSignUp(newUserData: newUserData) { [weak self]
            responseMsg in
            self?.view?.load()
        } failure: { [weak self] error in
            self?.view?.failure()
        }
    }
    
    func isUserNameValid(userName: String) -> Bool {
        let userNameRegex = "^[a-zA-Z]{3,}$"
        if (userName.range(of: userNameRegex, options: .regularExpression) != nil) {
            return true
        }
        return false
    }
    
    func isMailIdValid(emailId: String) -> Bool {
        let emailRegex = "(^[a-z]{1,})(\\.?)([a-z0-9]{2,64})@{1}([a-z0-9]{2,10})\\.{1}[a-z0-9]{2,5}(\\.?)([a-z]{2,10})?"
        if emailId.range(of: emailRegex, options: .regularExpression) != nil {
            return true
        }
        return false
    }
    
    func isNewPasswordValid(newPassword: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*\\W).{8,}$"
        
        if newPassword.range(of: passwordRegex, options: .regularExpression) != nil {
            return true
        }
            return false
    }
    
    func isConfirmPasswordMatches(confirmPassword: String, newPassword: String) -> Bool {
        
        if confirmPassword == newPassword { return true }
        return false
    }
    
    
    
    
    
}
