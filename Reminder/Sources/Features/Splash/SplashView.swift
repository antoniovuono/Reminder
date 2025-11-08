//
//  SplashView.swift
//  Reminder
//
//  Created by Antonio Vuono on 08/11/25.
//

import Foundation
import UIKit

class SplashView: UIView {
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .blue
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        
    }
}

