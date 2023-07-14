//
//  ViewController.swift
//  SplitViewSample
//
//  Created by arun-pt6232 on 28/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    let splitVC = UISplitViewController(style: .doubleColumn)  //icon

    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(splitVC.view)
//        addChild(splitVC)
        splitViewButtonTapped()
    }
    
   func splitViewButtonTapped() {
//       splitVC.view.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        splitVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        splitVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        splitVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        splitVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
       ])
       
       
       let menuVC = MenuController(style: .plain)
        menuVC.delegate = self
        
        let secondVC = UIViewController()
        secondVC.title = "Colors"
        secondVC.view.backgroundColor = .systemBackground

       
        splitVC.viewControllers = [
            UINavigationController(rootViewController: menuVC),
            UINavigationController(rootViewController: secondVC),
        ]
       
//        splitVC.preferredDisplayMode = .automatic
       splitVC.modalPresentationStyle = .fullScreen
        present(splitVC, animated: true)
    }
  
}


extension ViewController: MenuDelegate {
    
    func didTapMenuItem(index: IndexPath, title: String) {
        
        (splitVC.viewControllers.last as? UINavigationController)?.popViewController(animated: true)
        
        let vc = UIViewController()
        vc.view.backgroundColor = .systemPink
    
        (splitVC.viewControllers.last as? UINavigationController)?.pushViewController(vc, animated: true)
    }
}


protocol MenuDelegate: AnyObject {
    func didTapMenuItem(index: IndexPath, title: String)
}


class MenuController: UITableViewController {
    
    weak var delegate: MenuDelegate?
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        title = "Menu"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Choice \(indexPath.row)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let label = tableView.cellForRow(at: indexPath)?.textLabel?.text
        delegate?.didTapMenuItem(index: indexPath, title: label!)
    }
    
}

//    func configureButton() {
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemRed
//        button.setTitle("Split View", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
//        button.addTarget(self, action: #selector(splitViewButtonTapped), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.heightAnchor.constraint(equalToConstant: 100),
//            button.widthAnchor.constraint(equalToConstant: 200)
//        ])
//    }
    
