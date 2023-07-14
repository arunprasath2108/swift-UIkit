//
//  VideoListVC.swift
//  TableViewProgrammatic
//
//  Created by arun-pt6232 on 30/01/23.
//

import UIKit


class VideoListVC: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gallery"
        videos = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setupDelegates()            // setting delegates for tableView
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        tableView.pinToEdge(to: view)  //set constraint to pin to edge of view
    }
    
    func setupDelegates() {
        tableView.delegate   = self
        tableView.dataSource = self
    }
}


extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    
    //how many rows i like to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    //how i like to display the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        let videoIndex = videos[indexPath.row]
        cell.set(video: videoIndex)
        return cell
    }
}


extension VideoListVC {
    
    func fetchData() -> [Video] {
        
        let video1 = Video(image: Images.plant!, title: "Hello World!!!")
        let video2 = Video(image: Images.building!, title: "The Tallest Building in India")
        let video3 = Video(image: Images.sun!, title: "Here, the most warmest place in the planet")
        let video4 = Video(image: Images.pattern!, title: "The Colour Red")
        let video5 = Video(image: Images.tree!, title: "Natural scenery")
        let video6 = Video(image: Images.dessert!, title: "Dessert")
        let video7 = Video(image: Images.planet!, title: "Around the Earth")
        let video8 = Video(image: Images.horse!, title: "Horse Riding..!")
        let video9 = Video(image: Images.ship!, title: "Explore the Ocean")


        return [video1, video2, video3, video4, video5, video6, video7, video8, video9]
    }
}
