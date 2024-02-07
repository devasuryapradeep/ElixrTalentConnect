//
//  SignUpModelstructure.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//
import UIKit
import Foundation

/// Data model for Signup view controller.
enum SignupDataModel {
    case fullName
    case emailAdress
    case password
    case confirmPassword
}

//MARK: - Extension to the SignupDataModel
extension SignupDataModel {
    
    /// title is of type String and is the extended property of the enum SignupDataModel
    var title: String {
        switch self {
        case .fullName:
            return "FULL NAME"
        case .emailAdress:
            return "EMAIL ADDRESS"
        case .password:
            return "PASSWORD"
        case .confirmPassword:
            return "CONFIRM PASSWORD"
        }
    }
    
    /// placeHolder is of type String and is the extended property of the enum SignupDataModel
    var placeHolder : String{
        switch self {
        case .fullName:
            return "Enter your user name."
        case .emailAdress:
            return "Enter your Email ID."
        case .password:
            return "Enter your password."
        case .confirmPassword:
            return "Confirm Your password "
        }
    }
    
    /// Icon is of type UIimage and is the extended property of the enum SignupDataModel.
    var icon : String {
        switch self{
        case .fullName:
            return "person"
        case .emailAdress:
            return "envelope"
        case .password:
            return "lock"
        case .confirmPassword:
            return "lock"
        }
    }
    
    /// isVisible is of type UIimage and is the extended property of the enum SignupDataModel.
    var isVisible:Bool {
        switch self {
        case .fullName:
            return false
        case .emailAdress:
            return false
        case .password:
            return true
        case .confirmPassword:
            return  true
        }
    }
}
