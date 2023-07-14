//
//  ViewController.swift
//  PageVC
//
//  Created by arun-pt6232 on 03/03/23.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    lazy var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    lazy var viewControllers : [UIViewController] = {
        
        let v1 = UIViewController()
        v1.view.backgroundColor = .systemBlue
        
        let v2 = UIViewController()
        v2.view.backgroundColor = .systemBrown
        
        let v3 = UIViewController()
        v3.view.backgroundColor = .systemGreen
        
        return [v1, v2, v3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageVC()
    }
    
    func configurePageVC() {
        addChild(pageVC)
        view.addSubview(pageVC.view)
        pageVC.view.frame = view.frame
        pageVC.didMove(toParent: self)
        pageVC.dataSource = self
        
        pageVC.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let reducedIndex = index - 1

        guard reducedIndex >= 0 else {
            return nil
        }

        guard viewControllers.count > reducedIndex else {
            return nil
        }

        return viewControllers[reducedIndex]
        
        
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let increasedIndex = index + 1
        
        guard increasedIndex >= 0 else {
            return nil
        }
        
        guard viewControllers.count > increasedIndex else {
            return nil
        }
        
        return viewControllers[increasedIndex]
    }

}

