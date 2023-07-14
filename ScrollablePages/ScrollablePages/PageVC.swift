//
//  ViewController.swift
//  ScrollablePages
//
//  Created by arun-pt6232 on 15/02/23.
//

import UIKit

class PageVC: UIPageViewController {
    
    lazy var pagesVC = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        let vc = UIViewController()
        pagesVC.append(vc)
    }
    
    func presentPageVC() {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        vc.delegate = self
        vc.dataSource = self
        
        vc.setViewControllers([], direction: .forward, animated: true)
        
    }
    
    
}

extension PageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
}
