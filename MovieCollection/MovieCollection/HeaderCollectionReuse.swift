//
//  HeaderCollectionReuse.swift
//  MovieCollection
//
//  Created by arun-pt6232 on 23/02/23.
//

import UIKit

class HeaderCollectionReuse: UICollectionReusableView {
        
    static let headerIdentifier = "HeaderCollection"
    private let label = UILabel()
    
    public func configureHeader() {
        addSubview(label)
        configureLabel()
    }
    
    func configureLabel() {
        label.text = "Header"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .systemGreen
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds  
    }
}


class FooterCollectionReuse: UICollectionReusableView {
        
    static let footerIdentifier = "FooterCollection"
    private let label = UILabel()
    
    public func configureFooter() {
        addSubview(label)
        configureLabel()
    }
    
    func configureLabel() {
        label.text = "Footer"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .systemGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
