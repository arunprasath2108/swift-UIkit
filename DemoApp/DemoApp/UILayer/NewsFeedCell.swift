//
//  TableViewCell.swift
//  DemoApp
//
//  Created by arun-pt6232 on 14/03/23.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    var news: Article?

    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postedDateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = .systemFont(ofSize: 13, weight: .medium)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    
    private lazy var titleView: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.numberOfLines = 3
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var optionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(titleView)
        contentView.addSubview(postedDateLabel)
        contentView.addSubview(optionButton)
    }
    
    private func configureUI() {
//        configureImageView()
//        configureDateLabel()
//        configureTitleView()
//        configureMoreOptionsButton()
        configureImageView()
        configureTitleView()
        configureMoreOptionsButton()
        configureDateLabel()
    }
    
    func setNews(article: Article) {
        self.news = article
        postedDateLabel.text = article.publishedAt! + "  .  " + (article.source?.name)!
        titleView.text = article.title
        
        NewsFeedPresenter().getImage(imageURL: article.urlToImage!) { [self] image, imageURL in
            if news?.urlToImage == imageURL {
                if let image = image {
                    newsImageView.image = image
                }
                else {
                    newsImageView.image = UIImage(named: "Shopping")!
                }
            }
        }
    }
    
    private func configureImageView() {
        NSLayoutConstraint.activate([
        
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            newsImageView.heightAnchor.constraint(equalToConstant: 120),
            newsImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
        
    }
    
    private func configureDateLabel() {
        NSLayoutConstraint.activate([
            postedDateLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            postedDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            postedDateLabel.heightAnchor.constraint(equalToConstant: 15),
            postedDateLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 10),
            postedDateLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 100)
        ])
    }
    
    private func configureTitleView() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 15),
            titleView.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 10),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureMoreOptionsButton() {
        NSLayoutConstraint.activate([
            optionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            optionButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
    }
    
    func setImage(image: UIImage) {
        
        self.newsImageView.image = image
    }

}






