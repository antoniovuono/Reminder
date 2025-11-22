//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Antonio Vuono on 22/11/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    //MARK: - Properties
    private var navigationViewController: UINavigationController?
    //MARK: - Splash
    //MARK: - Login
    //MARK: - Init
    public init() {}
    //MARK: - StartFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationViewController = UINavigationController(rootViewController: startViewController)
        return navigationViewController
    }
}
