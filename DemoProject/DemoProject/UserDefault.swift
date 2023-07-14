//
//  UserDefault.swift
//  DemoProject
//
//  Created by arun-pt6232 on 09/03/23.
//

import Foundation

class UserDefaultManager {
    
    private let isLoggedInKey = "isLoggedIn"
    private let userDefaults = UserDefaults.standard
    private var isUserLoggedIn = false
    static let shared = UserDefaultManager()
    
    private init() {}
    
    func isLoggedIn() -> Bool {
        
        if userDefaults.bool(forKey: isLoggedInKey) {
            return true
        }
        return false
        
    }
    
    func setLogIn(value: Bool) {
        isUserLoggedIn = value
        userDefaults.set(value, forKey: isLoggedInKey)
    }
}
