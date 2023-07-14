//
//  NewsViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 03/04/23.
//

import UIKit
import WebKit

class NewsViewController: UIViewController, WKNavigationDelegate {
    
    let loadingIndicator = UIActivityIndicatorView(style: .large)
    let webkit = WKWebView(frame: .zero)
    var urlString: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webkit.frame = view.bounds
        webkit.navigationDelegate = self
        view.addSubview(webkit)
        view.addSubview(loadingIndicator)
        configureLoadingIndicator()
        showLoadingIndicator()
        loadPage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideLoadingIndicator()
    }
    
    init(url: String) {
        super.init(nibName: nil, bundle: nil)
        urlString = url
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadPage() {
        guard let url = URL(string: urlString!) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webkit.load(urlRequest)
    }
    
    func configureLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.center = view.center
        loadingIndicator.color = .black
        loadingIndicator.hidesWhenStopped = true
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func showLoadingIndicator() {
        loadingIndicator.startAnimating()
    }

    func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
//    // Handle successful page loading
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        hideLoadingIndicator()
//    }
//
//    // Handle page loading errors
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//        print("Page failed to load: \(error.localizedDescription)")
//    }
    
//    private lazy var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .systemRed
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.isUserInteractionEnabled = true
//       return scrollView
//    }()
//
//    private lazy var newsSourceView: UILabel = {
//        let newsSourceView = UILabel()
//        newsSourceView.font = .systemFont(ofSize: 22, weight: .semibold)
//        newsSourceView.translatesAutoresizingMaskIntoConstraints = false
//        newsSourceView.backgroundColor = .systemBlue
//        newsSourceView.text = "   The Hindu"
//        return newsSourceView
//    }()
//
//    private lazy var newsTitleLabel: UILabel = {
//        let newsTitleLabel = UILabel()
//        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        newsTitleLabel.text = "Do you have any thoughts or feedback? Please leave your comment. Hope you guys enjoy it and press if you like it"
//        newsTitleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
//        newsTitleLabel.backgroundColor = .systemGreen
//        newsTitleLabel.lineBreakMode = .byWordWrapping
//        newsTitleLabel.numberOfLines = 0
//        return newsTitleLabel
//    }()
//
//    private lazy var newsAuthorNameView: UILabel = {
//        let authorNameView = UILabel()
//        authorNameView.font = .systemFont(ofSize: 19, weight: .regular)
//        authorNameView.translatesAutoresizingMaskIntoConstraints = false
//        authorNameView.backgroundColor = .systemTeal
//        authorNameView.text = "author :- Jim kennady"
//        return authorNameView
//    }()
//
//    private lazy var newsImageView: UIImageView = {
//        let newsImageView = UIImageView()
//        newsImageView.translatesAutoresizingMaskIntoConstraints = false
//        newsImageView.backgroundColor = .systemGray
//        newsImageView.layer.cornerRadius = 15
//        newsImageView.contentMode = .scaleAspectFit
//        return newsImageView
//    }()
//
//    private lazy var lineView: UIView = {
//        let lineView = UIView()
//        lineView.translatesAutoresizingMaskIntoConstraints = false
//        lineView.backgroundColor = UIColor.black
//        return lineView
//    }()
//
//    private lazy var newsPostedDate: UILabel = {
//       let postedDateLabel = UILabel()
//        postedDateLabel.backgroundColor = .systemRed
//        postedDateLabel.text = "  posted on 29 jan 2023  "
//        postedDateLabel.font = .italicSystemFont(ofSize: 15)
//        postedDateLabel.translatesAutoresizingMaskIntoConstraints = false
//        return postedDateLabel
//    }()
//
//
//    private lazy var newsContentView: UILabel = {
//        let newsContentView = UILabel()
//        newsContentView.translatesAutoresizingMaskIntoConstraints = false
//        newsContentView.backgroundColor = .systemMint
//        newsContentView.text = "hgjknbvgh newsTitle  newsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), newsTitle  newsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), newsTitle  newsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),"
//        newsContentView.font = .systemFont(ofSize: 23, weight: .medium)
//        newsContentView.numberOfLines = 0
//        newsContentView.lineBreakMode = .byWordWrapping
//        return newsContentView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSubviews()
//        configureUI()
//    }
//
//    private func configureUI() {
//        configureScrollView()
////        configureNewsSourceView()
//        configureNewsTitleLabel()
//        configureNewsAuthorNameView()
//        configureNewsImageView()
//        configureLineView()
//        configurePostedDateView()
//        configureNewsContentView()
//    }
//
//    private func addSubviews() {
//        view.addSubview(scrollView)
////        scrollView.addSubview(newsSourceView)
//        scrollView.addSubview(newsTitleLabel)
//        scrollView.addSubview(newsAuthorNameView)
//        scrollView.addSubview(newsImageView)
//        scrollView.addSubview(lineView)
//        scrollView.addSubview(newsPostedDate)
//        scrollView.addSubview(newsContentView)
//    }
//
//    private func configureScrollView() {
//        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height*1.2)
//
//        NSLayoutConstraint.activate([
//            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//
//    private func configureNewsTitleLabel() {
//        NSLayoutConstraint.activate([
//            newsTitleLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            newsTitleLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            newsTitleLabel.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 16),
//            newsTitleLabel.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor)
//        ])
//
////        NSLayoutConstraint.activate([
////            newsTitleLabel.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
////            newsTitleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
////        ])
//    }
//
//    private func configureNewsImageView() {
//        let screenWidth = UIScreen.main.bounds.width
//        NSLayoutConstraint.activate([
//            newsImageView.widthAnchor.constraint(equalToConstant: screenWidth * 0.9),
//            newsImageView.heightAnchor.constraint(equalTo: newsImageView.widthAnchor, multiplier: 0.85),
//            newsImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            newsImageView.topAnchor.constraint(equalTo: newsAuthorNameView.bottomAnchor, constant: 25)
//        ])
//    }
//
//    private func configureNewsContentView() {
//        NSLayoutConstraint.activate([
//            newsContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            newsContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            newsContentView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
//            newsContentView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
//        ])
//    }
//
//    private func configureNewsSourceView() {
//        NSLayoutConstraint.activate([
//            newsSourceView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            newsSourceView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            newsSourceView.topAnchor.constraint(equalTo:
//                scrollView.topAnchor, constant: 16),
//            newsSourceView.centerXAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.centerXAnchor)
//        ])
//    }
//
//    private func configureNewsAuthorNameView() {
//        NSLayoutConstraint.activate([
//            newsAuthorNameView.topAnchor.constraint(equalTo:
//                newsTitleLabel.bottomAnchor, constant: 10),
//            newsAuthorNameView.leadingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor)
//        ])
//    }
//
//    private func configurePostedDateView() {
//        NSLayoutConstraint.activate([
//            newsPostedDate.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
//            newsPostedDate.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -25)
//        ])
//    }
//
//    private func configureLineView() {
//        NSLayoutConstraint.activate([
//            lineView.widthAnchor.constraint(equalTo: newsImageView.widthAnchor),
//            lineView.heightAnchor.constraint(equalToConstant: 1),
//            lineView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 17),
//            lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
    
    
    
    
    

}
