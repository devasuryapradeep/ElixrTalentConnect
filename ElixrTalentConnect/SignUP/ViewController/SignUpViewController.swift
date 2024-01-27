//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 12/01/24.
//

import UIKit

/// SignUpViewController - is the view through which user can add their user Credentials.
class SignUpViewController: UIViewController {
    
    /// Referencing Outlets.
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var SignUpTableview: UITableView!
    @IBOutlet weak var promptSignup: UILabel!
    
    /// Variable Declaration.
    var dataheading :[String]?
    var firstCellPlaceholder:String?
    let cellTypes: [SignupDataModel] = [.fullName, .emailAdress, .password, .confirmPassword]
    let viewModalInstance = SignUpViewModel()
    var isOn : Bool = true
    
    /// View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .highlighted)
        backButton.tintColor = UIColor.gray
        self.view.endEditing(true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    /// SignIn actiion
    /// - Parameter sender: UIButton
    @IBAction func SignUpTapped(_ sender: UIButton) {
        authenticationOnSignup()
    }
    
    ///@IBAction to set up return button to the rootview controller.
    /// - Parameter sender: UIButton
    @IBAction func returnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    /// Function SignIn- to perform sign in functionality.
    /// - Parameter sender: UIButton.
    @IBAction func signInTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /// Function to navigate on validating some crirteria on the text fields.
    func authenticationOnSignup(){
        let fullNameCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .fullName) ?? 0, section: 0)) as? ProfileDisplayCell
        let emailCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .emailAdress) ?? 0, section: 0)) as? ProfileDisplayCell
         let passwordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .password) ?? 0, section: 0)) as? ProfileDisplayCell
        let confirmPasswordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of:.confirmPassword) ?? 0, section: 0)) as? ProfileDisplayCell
            let fullName = fullNameCell?.userInput.text
            let email = emailCell?.userInput.text
        let password = passwordCell!.userInput.text
            let confirmPassword = confirmPasswordCell?.userInput.text
            if let errorMessage = viewModalInstance.validateCredentials(fullName: fullName, emailAddress: email, password: password, confirmPassword: confirmPassword) {
                showAlert(message: errorMessage)
                
            } else {
                performSegue(withIdentifier: "HomeViewController", sender: UIButton.self)
            }
        }
        
        /// showAlert
        /// - Parameter message: This is the fuction responsible to the alert on validating the criterias.
        func showAlert(message:String){
            let ok = UIAlertAction(title: "OK", style: .default)
            let alertOnValidation = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alertOnValidation.addAction(ok)
            present(alertOnValidation, animated: true)
        }
}
extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

