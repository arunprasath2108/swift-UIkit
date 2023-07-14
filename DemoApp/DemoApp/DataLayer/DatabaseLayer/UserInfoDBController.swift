//
//  UserInfoDBController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 16/03/23.
//

import Foundation

class UserInfoDBController {
    
    
    func addUser(newUser: User, success: @escaping(String) -> Void, failure: @escaping (String) -> Void) {
        
        let tableName = DBConstant.USERINFO_TABLE
        let columns = [
            DBConstant.USER_NAME : newUser.username,
            DBConstant.EMAIL_ID : newUser.emailID,
            DBConstant.PASSWORD : newUser.password
        ]
        
        if !DBConnector.shared.insert(tableName: tableName, values: columns) {
            failure("Error in DB")
            return
        }
        success("Added")
    }
    
    func isUserPresent(mailID: String, password: String, completion: @escaping (Bool) -> Void) {
        
//        let tableName = DBConstant.USERINFO_TABLE
//        let
        if mailID == "arun@gmail.com" && password == "Arun@123" {
            completion(true)
        }
        else {
            completion(false)
        }
    }
    
}
