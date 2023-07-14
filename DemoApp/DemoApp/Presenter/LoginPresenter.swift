//
//  LoginPresenter.swift
//  DemoApp
//
//  Created by arun-pt6232 on 13/03/23.
//

import Foundation

class LoginPresenter {
    
    let loginAsUserUseCase = loginUseCase()
    var view: LoginViewController?
    
    func isUserPresent(mailID: String, password: String, completion: @escaping (Bool) -> Void) {
        
        loginAsUserUseCase.loginAsUser(emailId: mailID, password: password) { responseMsg in
            completion(responseMsg)
        } 
    }
}
