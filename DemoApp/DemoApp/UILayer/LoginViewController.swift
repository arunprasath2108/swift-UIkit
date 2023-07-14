//
//  LoginViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 10/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginPresenter = LoginPresenter()
    
    private lazy var topImageContainer: UIView = {
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        return topImageContainer
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = " User name or Email ID"
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = " Enter your password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemRed
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(didLoginButtontapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpLabel: UILabel = {
        let signUpLabel = UILabel()
        signUpLabel.text = "SignUp"
        signUpLabel.textColor = .red
        signUpLabel.font = .systemFont(ofSize: 16, weight: .medium)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSignUpLabelTapped))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(tapGesture)
        return signUpLabel
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = " Invalid username or password "
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemBackground
        label.backgroundColor = .systemRed
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
            addSubView()
            configureUI()
    }
    
    private func addSubView() {
        view.addSubview(topImageContainer)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(createAccountLabel)
        view.addSubview(signUpLabel)
        view.addSubview(errorLabel)
    }
    
    private func configureUI() {
        configureHalfContainerView()
        configureUserNameTextField()
        configurePasswordTextField()
        configureLoginButton()
        configureCreateAccountLabel()
        configureSignUpButton()
        configureErrorLabel()
    }
    
    private func configureHalfContainerView() {
        NSLayoutConstraint.activate([
            topImageContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
    }

    private func configureUserNameTextField() {
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor, constant: -30),
            userNameTextField.widthAnchor.constraint(equalToConstant: 250),
            userNameTextField.heightAnchor.constraint(equalToConstant: 45),
            userNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func configurePasswordTextField() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func configureLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 75),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func configureCreateAccountLabel() {
        NSLayoutConstraint.activate([
            createAccountLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            createAccountLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 22)
        ])
    }
    
    private func configureSignUpButton() {
        NSLayoutConstraint.activate([
            signUpLabel.leadingAnchor.constraint(equalTo: createAccountLabel.trailingAnchor, constant: 5),
            signUpLabel.centerYAnchor.constraint(equalTo: createAccountLabel.centerYAnchor)
        ])
    }
    
    private func configureErrorLabel() {
        NSLayoutConstraint.activate([
            errorLabel.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: -8),
            errorLabel.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor)
        ])
    }
    
    
    @objc func didSignUpLabelTapped() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true)
    }
    
    @objc func didLoginButtontapped() {
        loginPresenter.isUserPresent(mailID: userNameTextField.text ?? "nil", password: passwordTextField.text ?? "nil") { [weak self] isUserPresent in
            
            if isUserPresent == true {
                UserDefaults.standard.set(true, forKey: UserDefaults.loginKey)
                UserDefaults.standard.synchronize()
                let homePage = HomePageViewController()
                homePage.modalPresentationStyle = .fullScreen
                self?.present(homePage, animated: true)
            }
            else {
                self?.errorLabel.isHidden = false
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

}
