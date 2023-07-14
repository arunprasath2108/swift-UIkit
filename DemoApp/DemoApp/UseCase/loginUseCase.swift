//
//  loginAsUser.swift
//  DemoApp
//
//  Created by arun-pt6232 on 03/04/23.
//

import Foundation

class loginUseCase {
    
    let database = UserInfoDBController()
    
    func loginAsUser(emailId: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.global().async {
            self.database.isUserPresent(mailID: emailId, password: password) { responseMsg in
                
                DispatchQueue.main.async {
                    completion(responseMsg)
                }
            } 
        }
    }
    
    
}
