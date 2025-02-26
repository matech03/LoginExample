//
//  ViewController.swift
//  LoginExample
//
//  Created by khanhspm on 24/02/2025.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        print("inin")
        view.backgroundColor = App.color.background
    }
}
