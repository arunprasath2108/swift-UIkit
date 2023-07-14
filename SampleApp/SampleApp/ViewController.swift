//
//  ViewController.swift
//  SampleApp
//
//  Created by arun-pt6232 on 01/02/23.
//

import UIKit

class ViewController: UIViewController {

    let topImage = UIView()
    let galleryButton = UIButton()
    let dogImageView  = UIImageView()
    let textLabel = UILabel()
    let collectionButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureImageView()
        configureHalfImageContainer()
        configureText()
        configureGalleryButton()
        configureCollectionButton()
    }
    
    func configureImageView() {
        topImage.addSubview(dogImageView)
        dogImageView.translatesAutoresizingMaskIntoConstraints = false
        dogImageView.image = UIImage(named: "dog")
        dogImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            dogImageView.centerXAnchor.constraint(equalTo: topImage.centerXAnchor),
            dogImageView.centerYAnchor.constraint(equalTo: topImage.centerYAnchor),
            dogImageView.heightAnchor.constraint(equalTo: topImage.heightAnchor, multiplier: 0.7)
        ])
    }
    
    func configureHalfImageContainer() {
        view.addSubview(topImage)
        topImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImage.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configureText() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "For pets and their people!"
        textLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        textLabel.numberOfLines = 0
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            textLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor),
        ])
    }
    
    func configureGalleryButton() {
        view.addSubview(galleryButton)
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        galleryButton.backgroundColor = .systemPink
        galleryButton.layer.cornerRadius = 12
        galleryButton.setTitle("Gallery", for: .normal)
        galleryButton.setTitleColor(.white, for: .normal)
        galleryButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        galleryButton.addTarget(self, action: #selector(galleryButtonClick), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            galleryButton.heightAnchor.constraint(equalToConstant: 50),
            galleryButton.widthAnchor.constraint(equalToConstant: 120),
            galleryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            galleryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100)
        ])
    }
    
    @objc func galleryButtonClick() {
        //left bar and right bar button items
        let imageVC = ImageVC()   //tableview - controller
        let _ = UINavigationController(rootViewController: imageVC)
        navigationController?.pushViewController(imageVC, animated: true)
    }
    
    func configureCollectionButton() {
        view.addSubview(collectionButton)
        collectionButton.translatesAutoresizingMaskIntoConstraints = false
        collectionButton.backgroundColor = .systemBlue
        collectionButton.setTitle("Collections", for: .normal)
        collectionButton.layer.cornerRadius = 12
        collectionButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)

        collectionButton.addTarget(self, action: #selector(collectionButtonClick), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            collectionButton.heightAnchor.constraint(equalToConstant: 50),
            collectionButton.widthAnchor.constraint(equalToConstant: 120),
            collectionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                    constant: -60),
            collectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100)
        ])
    }
    
    @objc func collectionButtonClick() {
        let collectionVC = CollectionVC()
        let _ = UINavigationController(rootViewController: collectionVC)
        navigationController?.pushViewController(collectionVC, animated: true)
    }
    
   
    
   
    
}


