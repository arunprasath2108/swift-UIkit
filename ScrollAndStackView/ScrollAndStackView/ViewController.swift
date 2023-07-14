//
//  ViewController.swift
//  ScrollAndStackView
//
//  Created by arun-pt6232 on 07/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView = UIScrollView()
    lazy var images = [UIImageView]()
    lazy var stack = UIStackView()
    lazy var pageControl = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemYellow
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        setupScrollView()
        setupStackView()
        setupPageControl()
        scrollView.delegate = self
    }
    
    func setupScrollView() {
    //frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//        scrollView.backgroundColor = .systemPink
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
//        scrollView.contentSize = CGSize(width: view.frame.width*1000, height: view.frame.height)
    }
    
    
    func setupStackView() {
        let building = UIImageView(image: UIImage(named: "building"))
        let sun = UIImageView(image: UIImage(named: "sun"))
        let plant = UIImageView(image: UIImage(named: "plant"))

        let images = [building, sun, plant]
        images.forEach { image in
            image.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            image.contentMode = .scaleAspectFill
        }
        
        stack.addArrangedSubview(building)
        stack.addArrangedSubview(sun)
        stack.addArrangedSubview(plant)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        scrollView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: view.frame.height/3).isActive = true
        stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 100).isActive = true
        stack.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -30).isActive = true
    }
    
    func setupPageControl() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        pageControl.numberOfPages = stack.arrangedSubviews.count
    }
    
}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
}
