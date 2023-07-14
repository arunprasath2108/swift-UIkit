//
//  AutoLayoutVC.swift
//  AutoLayoutApp
//
//  Created by arun-pt6232 on 28/01/23.
//

import UIKit

class AutoLayoutVC: UIViewController {

    let dogImage = UIImageView()
    let topImageContainer = UIView()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText  = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! we hope to see you in our stores soon. ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        textView.attributedText  = attributedText
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 1
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = .systemBlue
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureUI()
    }
    
    func configureUI() {
        configureHalfImageContainer()
        configureDogImage()
        configureTextView()
        configureBottomControls()
    }
    
    func configureHalfImageContainer() {
        view.addSubview(topImageContainer)
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
    }
    
    func configureDogImage() {
        topImageContainer.addSubview(dogImage)
        dogImage.translatesAutoresizingMaskIntoConstraints = false
        dogImage.image = UIImage(named: "dog")
        dogImage.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            dogImage.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor),
            dogImage.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor),
            dogImage.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.7)
        ])
    }
    
    func configureTextView() {
        view.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.textAlignment = .center
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureBottomControls() {
        
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton,
            pageControl, nextButton])
        
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually

        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
