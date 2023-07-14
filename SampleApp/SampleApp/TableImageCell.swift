//
//  ImageCellTableViewCell.swift
//  SampleApp
//
//  Created by arun-pt6232 on 01/02/23.
//

import UIKit

class TableImageCell: UITableViewCell {

    var imageDisplay = UIImageView()
    var title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageDisplay)
        addSubview(title)
        configureImageView()
        configureTitleLabel()
        setImageConstraint()
        setTitleConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        imageDisplay.layer.cornerRadius = 10
        title.clipsToBounds = true              //to show corner radius
    }
    
    func configureTitleLabel() {
        title.numberOfLines = 0
//      videoTitleLabel.adjustsFontSizeToFitWidth = true  //it adjusts the size based on no.of lines
    }
    
    func setImageConstraint() {
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false
        
        imageDisplay.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageDisplay.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        imageDisplay.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageDisplay.widthAnchor.constraint(equalTo: imageDisplay.heightAnchor, multiplier:  16/9).isActive = true
    }
    
    func setTitleConstraint() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: imageDisplay.trailingAnchor, constant: 20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 80).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func set(image: Image) {
        imageDisplay.image = image.image
        title.text = image.title
    }
    
}
