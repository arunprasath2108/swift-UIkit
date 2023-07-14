//
//  PhotoCollectionViewCell.swift
//  SampleApp
//
//  Created by arun-pt6232 on 06/02/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images = [
            Images.building,
            Images.tree,
            Images.sun,
            Images.ship,
            Images.plant,
            Images.planet,
            Images.pattern,
            Images.horse,
            Images.dessert
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        
    }
}
