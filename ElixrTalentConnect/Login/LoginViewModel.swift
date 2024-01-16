//
//  LoginViewModel.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 16/01/24.
//

import Foundation

/// LoginViewModel is considered as the Viewmodel which connects and updates both model and view.
class LoginViewModel {
    
    /// Variable and constants declarations.
    private let userInstance : UserValidation
    private var currentUser : UserModel?
    
    /// Initializer to intialize the
    /// - Parameter userValidation: userInstance that  is of type  UserValidation , that initializes itself so that the functions inside UserValidation can be used.
    init(userValidation: UserValidation) {
        self.userInstance = userValidation
    }
    
    /// This function connects data model with viewModel and on successful  fields the data is also passed to the model.
    /// - Parameters:
    ///   - userNamevalue: Variable of type string that hold the userInout in UserName and is then passed to the model
    ///   - passwordValue: Variable of type string that hold the password input in password and is then passed to the model.
    ///   - completion: This is an escaping closure inorder to outliver the present scope,  it determines what type of alert should be prompted to the viewcontroller and based its value navigaion to Homepage is executed.
    func validateUser (userNamevalue : String, passwordValue : String?,completion: @escaping(Bool,String?)->Void){
        userInstance.validate(userNameId: userNamevalue, passwordId: passwordValue) { isValid, errorMessage in
            if isValid{
                self.currentUser = UserModel(userName: userNamevalue,password: passwordValue)
            }
            completion(isValid,errorMessage)
        }
    }
    
    /// performLogin is the function that is resposible to check whether the user Credentials are already presented in the model or not  and also calls  wait of 2 seconds delay before executing the code. Nerwork request can be created from here. It is where the connection between view and viewmodel is done
    /// - Parameter completion: The escaping closure "completion" is used here which outlives its original scope.
    func performLogin (completion:@escaping(Bool,String?)->Void ){
        guard currentUser != nil else {
            completion(false,"UserData not found")
            return
        }
        DispatchQueue.global().asyncAfter(deadline: .now()+2)  {
            let success = true
            let errorMessage = success ? nil : "Failed to Log in"
            DispatchQueue.main.async {
                completion(success,errorMessage)
            }
        }
        
    }
    
    
}

