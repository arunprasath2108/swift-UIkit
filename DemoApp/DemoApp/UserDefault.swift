//
//  UserDefault.swift
//  DemoApp
//
//  Created by arun-pt6232 on 16/03/23.
//

import Foundation

extension UserDefaults {
    
     static let loginKey = "isLoggedIn"
    
    func setIsLoggedIn(value: Bool) {
        UserDefaults.standard.set(value, forKey: UserDefaults.loginKey)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaults.loginKey)
    }
}
