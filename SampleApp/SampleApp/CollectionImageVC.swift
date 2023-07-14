//
//  PhotoDisplayVC.swift
//  SampleApp
//
//  Created by arun-pt6232 on 06/02/23.
//


import UIKit

class CollectionImageVC: UIViewController {

    let image = UIImageView()
    let photoToDisplay: UIImage?
    
    
    init(clickedImage: UIImage) {
        photoToDisplay = clickedImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        configureImage()
    }

    func configureImage() {
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = photoToDisplay
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
