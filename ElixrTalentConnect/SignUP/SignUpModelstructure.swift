//
//  SignUpModelstructure.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//

import Foundation
enum dataModel{
    case FullName
    case EmailAdress
    case Password
    case confirmPassword
}
extension dataModel {
    var title: String {
        switch self {
        case .FullName:
            return "FULL NAME"
        case .EmailAdress:
            return "EMAIL ADDRESS"
        case .Password:
            return "PASSWORD"
        case .confirmPassword:
            return "CONFIRM PASSWORD"
        }
    }
}
extension dataModel {
    var textTitle : String{
        switch self {
        case .FullName:
            return "Enter your user name."
        case .EmailAdress:
            return "Enter your Email ID."
        case .Password:
            return "Enter your password."
        case .confirmPassword:
            return "Confirm Your password "
        }
    }
}
extension dataModel {
    var icon :String{
        switch self {
        case .FullName:
            return "person"
        case .EmailAdress:
            return "envelope"
        case .Password:
            return "lock"
        case .confirmPassword:
            return "lock "
        }
    }
}


