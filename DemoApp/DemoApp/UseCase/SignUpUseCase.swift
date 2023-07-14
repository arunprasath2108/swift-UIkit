//
//  SignUpUser.swift
//  DemoApp
//
//  Created by arun-pt6232 on 17/03/23.
//

import Foundation

class SignUpUseCase {

    let dataBase = UserInfoDBController()
    
    func userSignUp(newUserData: User, success: @escaping(String) -> Void, failure: @escaping(String) -> Void) {
        
        DispatchQueue.global().async {
            self.dataBase.addUser(newUser: newUserData) {
                responseMsg in
                success(responseMsg)
            } failure: { error in
                failure(error)
            }
        }
    }
}
