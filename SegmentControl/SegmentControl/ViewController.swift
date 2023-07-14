//
//  ViewController.swift
//  SegmentControl
//
//  Created by arun-pt6232 on 27/02/23.
//

import UIKit

class ViewController: UIViewController {

    let items = ["Green", "Blue", "Red"]
    
    lazy var segmentControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        return view
    }()
    
    let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(segmentControl)
        view.addSubview(colorView)
        configureViews()
    }

    func configureViews() {
        
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            segmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            segmentControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            
            colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            colorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            colorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    @objc func colorChanged() {
        
        switch segmentControl.selectedSegmentIndex {
            
            case 0 :
                colorView.backgroundColor = .systemGreen
            
            case 1 :
                colorView.backgroundColor = .systemBlue
            
            case 2 :
                colorView.backgroundColor = .systemRed
            
            default :
                colorView.backgroundColor = .darkGray
        }
    }
     

}

