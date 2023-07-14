//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 11/03/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpPresenter = SignUpPresenter()
    
    //storing new password for verifying with confirm password
    var newPasswordText: String = ""
    
    private lazy var boxView: UIScrollView = {
        let boxView = UIScrollView()
        boxView.layer.cornerRadius = 25
        boxView.backgroundColor = .systemGray3
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.contentSize = CGSize(width: boxView.frame.size.width, height: 750)
        return boxView
    }()
    
    private lazy var userNameView: SignUpView = {
        let userName = SignUpView()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.textField.placeholder = "Enter Username"
        userName.titleLabel.text = "Username"
        return userName
    }()
    
    private lazy var emailIdView: SignUpView = {
        let email = SignUpView()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textField.placeholder = "Enter your Email Address"
        email.titleLabel.text = "Email Id"
        return email
    }()
    
    private lazy var newPasswordView: SignUpView = {
        let password = SignUpView()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textField.placeholder = "Enter new password"
        password.titleLabel.text = "New password"
        password.textField.isSecureTextEntry = true
        return password
    }()
    
    private lazy var confirmPasswordView: SignUpView = {
        let password = SignUpView()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textField.placeholder = "Confirm new password"
        password.textField.isSecureTextEntry = true
        password.titleLabel.text = "Confirm password"
        return password
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.backgroundColor = .systemRed
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        signUpButton.layer.cornerRadius = 5
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(didSignUpLabelTapped), for: .touchUpInside)
        return signUpButton
    }()
    
    private lazy var alreadyAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "already have an account?"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "login"
        loginLabel.textColor = .red
        loginLabel.font = .systemFont(ofSize: 16, weight: .medium)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didLoginLabelTapped))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(tapGesture)
        return loginLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubView()
        configureUI()
        signUpPresenter.view = self
        userNameView.textField.delegate = self
        emailIdView.textField.delegate = self
        newPasswordView.textField.delegate = self
        confirmPasswordView.textField.delegate = self
    }
    
    private func addSubView() {
        view.addSubview(boxView)
        boxView.addSubview(userNameView)
        boxView.addSubview(emailIdView)
        boxView.addSubview(newPasswordView)
        boxView.addSubview(confirmPasswordView)
        boxView.addSubview(signUpButton)
        boxView.addSubview(alreadyAccountLabel)
        boxView.addSubview(loginLabel)
    }
    
    private func configureUI() {
        configureBoxView()
        configureUsernameView()
        configureEmailIdView()
        configureNewPasswordView()
        configureConfirmPasswordView()
        configureSignUpButton()
        configureAlreadyAccountLabel()
        configureLoginLabel()
    }
    
    private func configureBoxView() {
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            boxView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            boxView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            boxView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -110)
        ])
    }
    
    private func configureUsernameView() {
        NSLayoutConstraint.activate([
            userNameView.widthAnchor.constraint(equalToConstant: 200),
            userNameView.heightAnchor.constraint(equalToConstant: 50),
            userNameView.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 100),
            userNameView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor)
        ])
    }
    
    private func configureEmailIdView() {
        NSLayoutConstraint.activate([
            emailIdView.widthAnchor.constraint(equalToConstant: 200),
            emailIdView.heightAnchor.constraint(equalToConstant: 50),
            emailIdView.topAnchor.constraint(equalTo: userNameView.errorLabel.bottomAnchor, constant: 25),
            emailIdView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor)
        ])
    }
    
    private func configureNewPasswordView() {
        NSLayoutConstraint.activate([
            newPasswordView.widthAnchor.constraint(equalToConstant: 200),
            newPasswordView.heightAnchor.constraint(equalToConstant: 50),
            newPasswordView.topAnchor.constraint(equalTo: emailIdView.errorLabel.bottomAnchor, constant: 25),
            newPasswordView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor)
        ])
    }
    
    private func configureConfirmPasswordView() {
        NSLayoutConstraint.activate([
            confirmPasswordView.widthAnchor.constraint(equalToConstant: 200),
            confirmPasswordView.heightAnchor.constraint(equalToConstant: 50),
            confirmPasswordView.topAnchor.constraint(equalTo: newPasswordView.errorLabel.bottomAnchor, constant: 25),
            confirmPasswordView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor)
        ])
    }
    
    private func configureSignUpButton() {
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordView.errorLabel.bottomAnchor, constant: 40),
            signUpButton.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 45),
            signUpButton.widthAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func configureAlreadyAccountLabel() {
        NSLayoutConstraint.activate([
            alreadyAccountLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            alreadyAccountLabel.centerXAnchor.constraint(equalTo: boxView.centerXAnchor, constant: -25),
        ])
    }
    
    private func configureLoginLabel() {
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: alreadyAccountLabel.trailingAnchor, constant: 6),
            loginLabel.centerYAnchor.constraint(equalTo: alreadyAccountLabel.centerYAnchor)
        ])
    }
    
    @objc private func didLoginLabelTapped() {
        dismiss(animated: true)
    }
    
    @objc private func didSignUpLabelTapped() {

        let isCredentialsValid = isCredentialsValid()

        if isCredentialsValid == true {
            let newUser = User(username: userNameView.textField.text!, emailID: emailIdView.textField.text!, password: newPasswordView.textField.text!)
            signUpPresenter.signUpUser(newUserData: newUser)
        }
    }
    
    private func isCredentialsValid() -> Bool {
        
        if userNameView.errorLabel.isHidden == true && emailIdView.errorLabel.isHidden == true && newPasswordView.errorLabel.isHidden == true && confirmPasswordView.errorLabel.isHidden == true && userNameView.textField.text != "" && emailIdView.textField.text != "" && newPasswordView.textField.text != "" && confirmPasswordView.textField.text != "" {
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if newPasswordView.errorLabel.isHidden == false {
            confirmPasswordView.textField.isUserInteractionEnabled = false
        }
        else {
            confirmPasswordView.textField.isUserInteractionEnabled = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //text returned from the texfield
        let textMessage = textField.text ?? ""
        
        switch textField {
            
            case userNameView.textField:
            if signUpPresenter.isUserNameValid(userName: textMessage) == false {
                    userNameView.showError("Invalid User name")
                }
                else {
                    userNameView.hideError()
                }
            
            case emailIdView.textField:
            if signUpPresenter.isMailIdValid(emailId: textMessage) == false {
                    emailIdView.showError("Invalid Email Address")
                }
                else {
                    emailIdView.hideError()
                }
            
            case newPasswordView.textField:
            if signUpPresenter.isNewPasswordValid(newPassword: textMessage) == false {
                    newPasswordView.showError("Password must be minimum 8 characters long, includes uppercase, lowercase, numbers & special characters.")
                }
                else {
                    newPasswordText = textMessage
                    newPasswordView.hideError()
                }
            
            case confirmPasswordView.textField:
            if signUpPresenter.isConfirmPasswordMatches(confirmPassword: textMessage, newPassword: newPasswordText) == false {
                    confirmPasswordView.showError("Password doesn't matches.")
                }
                else {
                    confirmPasswordView.hideError()
                }
            
            default:
                return
        }
    }
    
    func load() {
        print("loaded")
//        let loginVC = LoginViewController()
//        present(loginVC, animated: true)
    }

    func failure() {
        print("Error")
    }
}




