//
//  HomePageViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 12/03/23.
//

import UIKit

class HomePageViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemRed
        
        UserDefaults.standard.set(true, forKey: UserDefaults.loginKey)
        UserDefaults.standard.synchronize()

        
        let vc1 = NewsFeedViewController()
        let navVC1 = UINavigationController(rootViewController: vc1)
        vc1.view.backgroundColor = .systemGray6
        let vc2 = SearchViewController()
        vc2.view.backgroundColor = .systemGray6
        let vc3 = MyAccountViewController()
        vc3.view.backgroundColor = .systemGray6
        
        let item1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), tag: 0)
        let item2 = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let item3 = UITabBarItem(title: "My Account", image: UIImage(systemName: "person.circle"), tag: 2)
        
        vc1.tabBarItem = item1
        vc2.tabBarItem = item2
        vc3.tabBarItem = item3
        
        setViewControllers([navVC1, vc2, vc3], animated: false)
        
    }

}
