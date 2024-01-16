//
//  LoginModel.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 15/01/24.
//

import Foundation

/// Model of the Login Page.
struct UserModel{
    var userName:String?
    var password:String?
}

/// This class has a valdiation function to check whether the fields are empty or not.
/// @escaping parameter is passed here, this will determines about type of error , navigation.
class UserValidation{
    func validate(userNameId:String?,passwordId:String?,completion: @escaping(Bool,String?)->Void){
        guard let userNameId = userNameId , !userNameId.isEmpty else {
            completion(false,"Username is empty.")
            return
        }
        guard let passwordId = passwordId , !passwordId.isEmpty else {
            completion (false,"password is empty.")
            return
        }
        completion(true,nil)
    }
    
    
}
