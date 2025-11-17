//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Antonio Vuono on 11/11/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.textColor = Colors.gray100
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        
        label.text = "login.label.email".localized
        label.textColor = Colors.gray100
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login.email.placeholder".localized
        textField.textColor = Colors.gray100
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = Metrics.tiny
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.borderWidth = 1
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        
        label.text = "login.label.password".localized
        label.textColor = Colors.gray100
        label.font = Typography.label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textColor = Colors.gray100
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = Metrics.tiny
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.borderWidth = 1
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.tintColor = Colors.gray800
        button.titleLabel?.font = Typography.subHeading
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
    
    @objc
    private func loginButtonDidTapped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
}
