//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Antonio Vuono on 15/11/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}
