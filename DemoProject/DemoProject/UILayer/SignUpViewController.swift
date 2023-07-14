//
//  SignUpViewController.swift
//  DemoProject
//
//  Created by arun-pt6232 on 09/03/23.
//

import UIKit

//class NewsFeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//
//    private var collectionView: UICollectionView!
////    private var items: [NewsItem] = [] // assume you have a custom NewsItem class to represent the news items
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // create a compositional layout
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
//            // define the layout for the section
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
//            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
//            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
//            return section
//        }
//
//        // create a collection view with the compositional layout
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(NewsFeedCell.self, forCellWithReuseIdentifier: "NewsFeedCell")
//        collectionView.backgroundColor = .white
//        view.addSubview(collectionView)
//
//        // load data for the collection view
//        loadData()
//    }
//
//    private func loadData() {
//        // assume you have a function to fetch news items from a data source
//        items = NewsItem.fetchNewsItems()
//        collectionView.reloadData()
//    }
//
//    // MARK: - UICollectionViewDataSource
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
//        cell.configure(with: items[indexPath.item])
//        return cell
//    }
//
//    // MARK: - UICollectionViewDelegate
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle cell selection here
//    }
//}
