//
//  MainViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 16/03/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
//        UserDefaults.standard.removeObject(forKey: UserDefaults.loginKey)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.isLoggedIn() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let homePage = HomePageViewController()
                homePage.modalPresentationStyle = .fullScreen
                self.present(homePage, animated: true)
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: true)
            }
        }
    }
    

}
