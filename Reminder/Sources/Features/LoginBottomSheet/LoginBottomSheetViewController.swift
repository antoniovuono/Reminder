//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Antonio Vuono on 11/11/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    let loginView = LoginBottomSheetView()
    let viewModel = LoginBottomSheetViewModel()
    let handleAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func bindViewModel() {
        viewModel.succesResult = { [weak self] in
           let viewController = UIViewController()
           viewController.view.backgroundColor = .red
            
           self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    private func setupGesture() {
        // todo
    }
    
    private func handlePanGesture() {
        // todo
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        print("email: \(user) password: \(password)")
        viewModel.doAuth(email: user, password: password)
    }
}
