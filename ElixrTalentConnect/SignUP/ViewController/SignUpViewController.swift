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
    var Dataheading :[String]?
    var firstCellPlaceholder:String?
    let cellTypes: [DataModel] = [.fullName, .emailAdress, .password, .confirmPassword]
    let textToChangeColor = " Sign in."
    let userInfoPrompt = "Already have an account? Sign in."
    let viewModalInstance = SignUpViewModel()
    /// View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .highlighted)
        backButton.tintColor = UIColor.gray
        SigupPromptSetup()
        self.view.endEditing(true)
        
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
    
    /// To  present a label that have attributed text field and tap gesture.
    func SigupPromptSetup(){
        let range = (userInfoPrompt as NSString).range(of: textToChangeColor)
        let attributedText = NSMutableAttributedString.init(string: userInfoPrompt)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0) , range: range)
        promptSignup.attributedText = attributedText
        let signInGesture = UITapGestureRecognizer(target: self, action:#selector(signUpAction(gesture: ) ))
        promptSignup.isUserInteractionEnabled = true
        promptSignup.addGestureRecognizer(signInGesture)
    }
    
    /// Action of tap gesture.
    /// - Parameter gesture: UItapgesture
    @objc func  signUpAction(gesture: UITapGestureRecognizer ){
        let termsRange = (userInfoPrompt as NSString).range(of: self.textToChangeColor)
        promptSignup.isUserInteractionEnabled = true
        if gesture.didTapAttributedTextInLabel(label: promptSignup, inRange: termsRange) {
            print("tapped")
            guard let rootView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            else {
                return
            }
            navigationController?.pushViewController(rootView, animated: true)
        }
    }
    
    /// Function to navigate on validating some crirteria on the text fields.
    func authenticationOnSignup(){
        let fullNameCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .fullName) ?? 0, section: 0)) as? ProfileDisplayCell
        let emailCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .emailAdress) ?? 0, section: 0)) as? ProfileDisplayCell
        let passwordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of: .password) ?? 0, section: 0)) as? ProfileDisplayCell
        let confirmPasswordCell = SignUpTableview.cellForRow(at: IndexPath(row: viewModalInstance.cellTypes.firstIndex(of:.confirmPassword) ?? 0, section: 0)) as? ProfileDisplayCell
        let fullName = fullNameCell?.userName.text
        let email = emailCell?.userName.text
        let password = passwordCell?.userName.text
        let confirmPassword = confirmPasswordCell?.userName.text
        
        if let errorMessage = viewModalInstance.validateCredentials(fullName: fullName, emailAddress: email, password: password, confirmPassword: confirmPassword) {
            showAlert(message: errorMessage)
        } else {
            navigateToHome()
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
    func navigateToHome(){
        guard  let homeview = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")as? HomeViewController else {
            return
        }
        navigationController?.pushViewController(homeview, animated: true)
    }
    
    
    
}
