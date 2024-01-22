//
//  SignUpModelstructure.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//
import UIKit
import Foundation

/// Data model for Signup view controller.
enum DataModel {
    case fullName
    case emailAdress
    case password
    case confirmPassword
}

extension DataModel {
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
