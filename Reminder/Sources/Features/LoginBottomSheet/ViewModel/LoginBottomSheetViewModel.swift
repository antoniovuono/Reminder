//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Antonio Vuono on 17/11/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var succesResult: (() -> Void)?
    
    
    func doAuth(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            [weak self] authResult, error in
            
            if let error = error {
                print(authResult, "Erro na autenticação!")
            } else {
                self?.succesResult?()
            }
        }
    }
}
