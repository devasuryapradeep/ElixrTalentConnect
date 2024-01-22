//
//  LoginViewModel.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//

import Foundation
import UIKit
import LocalAuthentication
/// LoginViewModel is considered as the Viewmodel which connects and updates both model and view.
    class LoginViewModel {
        
        func validateCredentials(model: UserModel) -> (isValid: Bool, message: String?) {
            guard !model.userName!.isEmpty, model.userName!.contains("@"), model.userName!.contains(".") else {
                return (false, "Please enter a valid email.")
            }
            guard !model.passwordValue!.isEmpty, isAlphanumeric(model.passwordValue!), model.passwordValue!.count >= 8 else {
                return (false, "Please enter a valid alphanumeric password.")
            }
            return (true, nil)
        }
     
        func authenticateWithBiometrics(completion: @escaping (Bool, Error?) -> Void) {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Biometrics") { (success, evalError) in
                    DispatchQueue.main.async {
                        completion(success, evalError)
                    }
                }
            } else {
                completion(false, error)
            }
        }
     
        func isAlphanumeric(_ string: String) -> Bool {
            let letterSet = CharacterSet.letters
            let digitSet = CharacterSet.decimalDigits
            return !string.isEmpty && string.rangeOfCharacter(from: letterSet) != nil && string.rangeOfCharacter(from: digitSet) != nil
        }
    }

