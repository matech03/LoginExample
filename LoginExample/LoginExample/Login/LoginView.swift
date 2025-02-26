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
    lazy var userNameTextField = PaddedTextField()
    lazy var passwordTextField = PaddedTextField()
    lazy var labelRecoveryText = UILabel()
    lazy var buttonSigin = UIButton()
    private let toggleButton = UIButton(type: .custom)
    lazy var leftRectangle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 2))
    lazy var labelContinue = UILabel()
    lazy var rightRectangle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 2))
    lazy var iconGoogle = UIImageView(image: UIImage(named: "icon_google"))
    lazy var iconApple = UIImageView(image: UIImage(named: "icon_apple"))
    lazy var iconFacebook = UIImageView(image: UIImage(named: "icon_facebook"))
    lazy var imageSocialView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    lazy var labelNotAMember = UILabel()
    lazy var labelRegister = UILabel()
    
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
        [labelTitle, labelDescription, userNameTextField, passwordTextField,
         labelRecoveryText, buttonSigin, labelContinue,
         iconGoogle, iconApple, iconFacebook,
//         imageSocialView,
         labelNotAMember, labelRegister, leftRectangle, rightRectangle].forEach {
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
            userNameTextField.widthAnchor.constraint(equalToConstant: 340),
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
            buttonSigin.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            buttonSigin.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            
            leftRectangle.topAnchor.constraint(equalTo: buttonSigin.bottomAnchor, constant: 60),
            leftRectangle.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            
            labelContinue.topAnchor.constraint(equalTo: buttonSigin.bottomAnchor, constant: 50),
            labelContinue.centerXAnchor.constraint(equalTo: buttonSigin.centerXAnchor),
            
            rightRectangle.topAnchor.constraint(equalTo: buttonSigin.bottomAnchor, constant: 60),
            rightRectangle.rightAnchor.constraint(equalTo: labelContinue.rightAnchor, constant: 50),
            
//            imageSocialView.topAnchor.constraint(equalTo: labelContinue.bottomAnchor, constant: 50),
            iconGoogle.topAnchor.constraint(equalTo: labelContinue.bottomAnchor, constant: 50),
            iconGoogle.widthAnchor.constraint(equalToConstant: 40),
            iconGoogle.heightAnchor.constraint(equalToConstant: 40),
            iconGoogle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),

            iconApple.topAnchor.constraint(equalTo: labelContinue.bottomAnchor, constant: 50),
            iconApple.widthAnchor.constraint(equalToConstant: 34),
            iconApple.heightAnchor.constraint(equalToConstant: 34),
            iconApple.leftAnchor.constraint(equalTo: iconGoogle.leftAnchor, constant: 40),
            iconApple.centerXAnchor.constraint(equalTo: buttonSigin.centerXAnchor),
            
            iconFacebook.topAnchor.constraint(equalTo: labelContinue.bottomAnchor, constant: 50),
            iconFacebook.widthAnchor.constraint(equalToConstant: 40),
            iconFacebook.heightAnchor.constraint(equalToConstant: 40),
            iconFacebook.leftAnchor.constraint(equalTo: iconApple.rightAnchor, constant: 20),
                        
            labelRegister.topAnchor.constraint(equalTo: iconFacebook.bottomAnchor, constant: 60),
            labelRegister.centerXAnchor.constraint(equalTo: buttonSigin.centerXAnchor),
        ])
    }
    
    private func setUpViews() {
        labelTitle.text = App.text.helloAgainText
        labelTitle.textColor = App.color.boldText
        labelTitle.font = .systemFont(ofSize: 30, weight: .bold)
        labelTitle.textAlignment = .center
        
        labelDescription.text = App.text.welcomeBackText
        labelDescription.textColor = App.color.primaryText
        labelDescription.font = .systemFont(ofSize: 24, weight: .medium)
        labelDescription.numberOfLines = 0
        labelDescription.sizeToFit()
        labelDescription.textAlignment = .center
        
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = App.color.primaryText
        userNameTextField.placeholder = "Enter username"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.cornerRadius = 12.0
        userNameTextField.clipsToBounds = true
        
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = App.color.primaryText
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = createToggleButton()
        passwordTextField.rightViewMode = .always
        passwordTextField.layer.cornerRadius = 12.0
        passwordTextField.clipsToBounds = true
        
        labelRecoveryText.text = "Recovery password"
        labelRecoveryText.textColor = App.color.primaryText
        labelRecoveryText.textAlignment = .right
        labelRecoveryText.font = .systemFont(ofSize: 14)
        
        buttonSigin.backgroundColor = App.color.redButton
        buttonSigin.setTitle("Sign In", for: .normal)
        buttonSigin.layer.cornerRadius = 12
        buttonSigin.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        styleRectangle(rectangle: leftRectangle, colors: [UIColor.clear.cgColor, UIColor.black.cgColor])
        
        labelContinue.text = "Or continue with"
        labelContinue.font = .systemFont(ofSize: 14, weight: .regular)
        
        styleRectangle(rectangle: rightRectangle, colors: [UIColor.black.cgColor, UIColor.clear.cgColor])
        
//        iconGoogle.frame = .infinite
        iconGoogle.backgroundColor = App.color.background
        iconGoogle.layer.cornerRadius = 8
//        iconGoogle.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        iconGoogle.contentMode = .scaleAspectFill
        
        iconApple.frame = .infinite
        iconApple.backgroundColor = App.color.background
        iconApple.layer.cornerRadius = 8
        iconApple.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        iconApple.contentMode = .scaleAspectFit
        iconApple.layer.borderColor = UIColor.white.cgColor
        
        iconFacebook.frame = .infinite
        iconFacebook.backgroundColor = App.color.background
        iconFacebook.layer.cornerRadius = 8
        iconFacebook.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        iconFacebook.contentMode = .scaleAspectFill
        iconFacebook.layer.borderColor = UIColor.white.cgColor
        
        let label1Text = NSAttributedString(string: "Not a member? ", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: App.color.primaryText
        ])

        let label2Text = NSAttributedString(string: "Register now", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: App.color.blueText
        ])

        let combinedText = NSMutableAttributedString()
        combinedText.append(label1Text)
        combinedText.append(label2Text)

        labelRegister.attributedText = combinedText

    }
    
    private func createToggleButton() -> UIView {
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        toggleButton.tintColor = .gray
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        toggleButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        toggleButton.center = paddingView.center
        paddingView.addSubview(toggleButton)
        return paddingView
    }
    
    private func styleRectangle(rectangle: UIView, colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.frame = rectangle.bounds
        gradient.colors = colors
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        rectangle.layer.insertSublayer(gradient, at: 0)
    }

    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let iconName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        toggleButton.setImage(UIImage(systemName: iconName), for: .normal)
    }
}
