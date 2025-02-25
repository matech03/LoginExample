//
//  LoginView.swift
//  LoginExample
//
//  Created by khanhspm on 24/02/2025.
//

import Foundation
import UIKit

final class LoginView: UIView {
    lazy var labelTitle = UILabel()
    lazy var labelDescription = UILabel()
    lazy var userNameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var labelRecoveryText = UILabel()
    lazy var buttonSigin = UIButton()
    private let toggleButton = UIButton(type: .custom)
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [labelTitle, labelDescription, userNameTextField, passwordTextField, labelRecoveryText, buttonSigin].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                    
            labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            labelDescription.centerXAnchor.constraint(equalTo: labelTitle.centerXAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 60),
            userNameTextField.centerXAnchor.constraint(equalTo: labelDescription.centerXAnchor),
            userNameTextField.widthAnchor.constraint(equalToConstant: 300),
            userNameTextField.heightAnchor.constraint(equalToConstant: 60),

            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            
            labelRecoveryText.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            labelRecoveryText.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor),
            labelRecoveryText.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            
            buttonSigin.topAnchor.constraint(equalTo: labelRecoveryText.bottomAnchor, constant: 40),
            buttonSigin.centerXAnchor.constraint(equalTo: labelRecoveryText.centerXAnchor),
            buttonSigin.widthAnchor.constraint(equalTo: labelRecoveryText.widthAnchor),
            buttonSigin.heightAnchor.constraint(equalTo: labelDescription.heightAnchor)
        ])
    }
    
    private func setUpViews() {
        labelTitle.text = App.text.helloAgainText
        labelTitle.textColor = .black
        labelTitle.font = .systemFont(ofSize: 30, weight: .bold)
        labelTitle.textAlignment = .center
        
        labelDescription.text = App.text.welcomeBackText
        labelDescription.textColor = .black
        labelDescription.font = .systemFont(ofSize: 20, weight: .semibold)
        labelDescription.numberOfLines = 0
        labelDescription.sizeToFit()
        labelDescription.textAlignment = .center
        
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .black
        userNameTextField.placeholder = "Enter username"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.cornerRadius = 12.0
        userNameTextField.clipsToBounds = true
        
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = createToggleButton()
        passwordTextField.rightViewMode = .always
        passwordTextField.layer.cornerRadius = 12.0
        passwordTextField.clipsToBounds = true
        
        labelRecoveryText.text = "Recovery password"
        labelRecoveryText.textColor = .black
        labelRecoveryText.textAlignment = .right
        labelRecoveryText.font = .systemFont(ofSize: 16)
        
        buttonSigin.backgroundColor = .red.withAlphaComponent(0.8)
        buttonSigin.setTitle("Sign in", for: UIControl.State())
        buttonSigin.layer.cornerRadius = 8
        
    }
    
    private func createToggleButton() -> UIButton {
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        toggleButton.tintColor = .gray
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        toggleButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return toggleButton
    }

    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        toggleButton.setImage(UIImage(systemName: iconName), for: .normal)
    }
}
