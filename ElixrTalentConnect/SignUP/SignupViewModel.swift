//
//  SignupViewModel.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 19/01/24.
//


import Foundation

/// ViewModel for SignupViewcontroller
class SignUpViewModel {
    
    /// Variable declarations.
    var cellTypes: [DataModel] = [.fullName, .emailAdress, .password, .confirmPassword]
    
    /// Function to validate user inputs, also generates alert message to return when the criteria for the specific validation meets.
    /// - Parameters:
    ///   - fullName: To create reference the text field -user name.
    ///   - emailAddress: To create reference the text field -user mail ID.
    ///   - password: To create reference to the text field -passworrd.
    ///   - confirmPassword: To create reference to the text field -Confirm passworrd.
    /// - Returns: String for alert message.
    func validateCredentials(fullName: String?, emailAddress: String?, password: String?, confirmPassword: String?) -> String? {
        guard let fullName = fullName, !fullName.isEmpty else {
            return "Please enter your full name."
        }
        
        
        guard let email = emailAddress, !email.isEmpty, email.contains("@"), email.contains(".") else {
            return "Please enter a valid email address."
        }
        
        
        guard let password = password, !password.isEmpty, password.count >= 8, password.contains(where: { $0.isLetter }), password.contains(where: { $0.isNumber }) else {
            return "Password should be at least 8 characters long and contain both alphabetic and numeric characters."
        }
        
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty, confirmPassword == password else {
            return "Passwords do not match."
        }
        
        return nil
    }
}
