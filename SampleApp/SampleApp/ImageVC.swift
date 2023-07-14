//
//  ImageVC.swift
//  SampleApp
//
//  Created by arun-pt6232 on 01/02/23.
//
//Table view cell styles

import UIKit

class ImageVC: UIViewController {
    
    let table = UITableView(frame: CGRect(), style: .plain)
    var images: [Image] = []
    
    var imagesDict: [String:[Image]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Gallery"
        images = fetchData()
        setDataSource()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(table)
        setupDelegate()
        
        //automatic height
        
        table.rowHeight = 100
        table.register(TableImageCell.self, forCellReuseIdentifier: "ImageCell")
        table.pinToEdge(to: view)
    }
    
    func setupDelegate() {
        table.delegate   = self
        table.dataSource = self
    }
}


extension ImageVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "end of section \(section)"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? TableImageCell
        let imageIndex = images[indexPath.row]
        cell?.set(image: imageIndex)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! TableImageCell
        let vc = TableImageVC(image: cell.imageDisplay.image!)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            self.images.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = UIContextualAction(style: .normal, title: "Done") { action, view, completion in
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [done])
    }
    
}

extension UIView {
    
    func pinToEdge(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


extension ImageVC {
    
    func fetchData() -> [Image] {
        
        let image1 = Image(image: Images.plant!, title: "Hello World!!!")
        let image2 = Image(image: Images.building!, title: "The Tallest Building in India")
        let image3 = Image(image: Images.sun!, title: "Here, the most warmest place in the planet")
        let image4 = Image(image: Images.pattern!, title: "The Colour Red")
        let image5 = Image(image: Images.tree!, title: "Natural scenery")
        let image6 = Image(image: Images.dessert!, title: "Dessert")
        let image7 = Image(image: Images.planet!, title: "Around the Earth")
        let image8 = Image(image: Images.horse!, title: "Horse Riding..!")
        let image9 = Image(image: Images.ship!, title: "Explore the Ocean")


        return [image1, image2, image3, image4, image5, image6, image7, image8, image9]
    }
    
    func setDataSource()
    {
        imagesDict["Section 0"] = images
        imagesDict["Section 1"] = images
    }
}
