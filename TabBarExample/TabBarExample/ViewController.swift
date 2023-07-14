
import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    lazy var button = UIButton()
    let tabBarVC = UITabBarController()
    let tabBar = UITabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.delegate = self
//        addChild(tabBarVC)
//        view.addSubview(tabBarVC.tabBar)
//        configureTabBarController()
        
//        view.addSubview(button)
//        configureButton()

        configureTabBar()
    }
    
    func configureTabBar()
    {
        let frst = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        tabBar.items = [frst]
        view.addSubview(tabBar)
        setUpConstraint()
        
        tabBar.tintColor = .systemRed
//        tabBar.barTintColor = .yellow
        tabBar.backgroundColor = .yellow
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let text = "Hello, world!"
//        print(text)
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
//        activityViewController.excludedActivityTypes = [.]
                present(activityViewController, animated: true, completion: nil)
//        activityViewController.popoverPresentationController?.sourceView = sender
//        self.present(activityViewController, animated: true, completion: nil)
    }

    func setUpConstraint() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    
//    func configureButton() {
//
//        button.backgroundColor = .systemRed
//        button.setTitle("Tab Bar", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.widthAnchor.constraint(equalToConstant: 150),
//            button.heightAnchor.constraint(equalToConstant: 70)
//        ])
//
//    }

    func  configureTabBarController()
    {
        tabBarVC.tabBar.backgroundColor = .systemBackground
        tabBarVC.tabBar.tintColor = .systemRed

        let vc1 = UIViewController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        vc1.view.backgroundColor = .systemRed

        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "plus.app"), tag: 1)
        vc2.view.backgroundColor = .systemCyan

        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "questionmark.diamond"), tag: 2)
        vc3.view.backgroundColor = .systemGreen

        let vc4 = UIViewController()
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        vc4.view.backgroundColor = .systemPink

        let vc5 = UIViewController()
        vc5.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 4)
        vc5.view.backgroundColor = .systemBrown


        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
//        tabBar.modalPresentationStyle = .fullScreen
//        present(tabBar, animated: true)
    }
    
    
    @objc func buttonTapped() {

        let tabBar = UITabBarController()
        tabBar.tabBar.backgroundColor = .systemBackground
        tabBar.tabBar.tintColor = .systemRed

        let vc1 = UIViewController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        vc1.view.backgroundColor = .systemRed

        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "plus.app"), tag: 1)
        vc2.view.backgroundColor = .systemCyan

        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "questionmark.diamond"), tag: 2)
        vc3.view.backgroundColor = .systemGreen

        let vc4 = UIViewController()
        vc4.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        vc4.view.backgroundColor = .systemPink

        let vc5 = UIViewController()
        vc5.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 4)
        vc5.view.backgroundColor = .systemBrown


        tabBar.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
//        tabBar.modalPresentationStyle = .fullScreen
//        present(tabBar, animated: true)
    }

}













//class ViewController: UIViewController {
//
//    lazy var button = UIButton()
//    let tabBar = UITabBar()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.addSubview(button)
//
//        let firstItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//        let second = UITabBarItem(title: "About", image: UIImage(systemName: "questionmark.diamond"), tag: 1)
//
//        tabBar.setItems([firstItem, second], animated: true)
//        tabBar.backgroundColor = .systemGreen
//        view.addSubview(tabBar)
//        configureButton()
//    }
//
//    func configureButton() {
//    button.backgroundColor = .systemRed
//    button.setTitle("Tab Bar", for: .normal)
//    button.titleLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//
//    NSLayoutConstraint.activate([
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        button.widthAnchor.constraint(equalToConstant: 150),
//        button.heightAnchor.constraint(equalToConstant: 70)
//    ])
//    }
//
//    @objc func buttonTapped() {
//
//        let v1 = UIViewController()
//        let v2 = UIViewController()
////
//        let firstItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//        let second = UITabBarItem(title: "About", image: UIImage(systemName: "questionmark.diamond"), tag: 1)
//
//        tabBar.setItems([firstItem, second], animated: true)
//
//
//    }
//
//}









//tabBar.tabBar.backgroundColor = .systemBackground
//
//let v1 = UIViewController()
//v1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
//v1.view.backgroundColor = .systemRed
//
//let v2 = UIViewController()
//v2.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "phone"), tag: 1)
//v2.view.backgroundColor = .systemTeal
//
////
//
//
//tabBar.setViewControllers([v1, v2], animated: false)
//
////        tabBar.view.translatesAutoresizingMaskIntoConstraints = false
//
//NSLayoutConstraint.activate([
//    tabBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//    tabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//    tabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//])
//
//
////        tabBar.modalPresentationStyle = .fullScreen
//        present(tabBar, animated: true)
