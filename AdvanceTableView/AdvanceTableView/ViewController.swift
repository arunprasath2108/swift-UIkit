//
//  ViewController.swift
//  AdvanceTableView
//
//  Created by arun-pt6232 on 09/02/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var datas: [String] = ["Arun is gud boy Arun is gud boy Arun is gud boy Arun is gud boy Arun is gud boy Arun is gud Arun is gud boy Arun is gud boy Arun is gud",
                            "Jack", "Guhan"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setHeader()
        setFooter()
        setupNavBarButtons()
    }
    
    func setHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        header.backgroundColor = .systemBackground
        let label = UILabel()
        header.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text Label"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            label.topAnchor.constraint(equalTo: header.topAnchor, constant: 10)
        ])
        
        tableView.tableHeaderView = header
    }
    
    func setFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        footer.backgroundColor = .systemBackground
        let label = UILabel()
        footer.addSubview(label)
        label.text = " End of the Table"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: footer.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: footer.trailingAnchor),
            label.topAnchor.constraint(equalTo: footer.topAnchor, constant: 10)
        ])
        
        tableView.tableFooterView = footer
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let backButton = UIImage(named: "chevron.backward")
        navigationItem.backBarButtonItem = UIBarButtonItem(image: backButton, style: .done, target: nil, action: nil)
        
        let vc = UIViewController()
        vc.view.backgroundColor = .systemBackground
        navigationController?.pushViewController(vc, animated: true)
//        let backButton = UIImage(named: "chevron.backward")
//        navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(image: backButton, style: .done, target: nil, action: nil)
    }
    
    func setupNavBarButtons() {
       
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)

        navigationItem.rightBarButtonItems = [doneButton, addButton]
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = cancelButton

    }

}

