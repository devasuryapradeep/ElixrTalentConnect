//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit
import LocalAuthentication
/// LoginViewcontroller contains  user authentication,sign-in ,sign-up.
/// View in MVVM.
class LoginViewController: UIViewController {
    
    /// Variables and constants  declaration
    private var viewModel : LoginViewModel!
    //MARK: - Referencing Outlets.
    /// Referencing  Outlets.
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInPromptLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    /// View Life cycle.- Contain method calls to setup basic UI.
    /// Setupcode to perform same action as that of IQkeyboard manager.
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        viewModel = LoginViewModel()
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        self.navigationItem.setHidesBackButton(true, animated: true)
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /// SignIntapped is the IBaction of the button "signInButton", which trigers alert actions,validation
    /// - Parameter sender: UIbutton named "signInButton".
    @IBAction func signInTapped(_ sender: UIButton){
        let loginModel = UserModel(userName: emailField.text , passwordValue:passwordField.text)
        let validationResult = viewModel.validateCredentials(model: loginModel)
        if validationResult.isValid {
            viewModel.authenticateWithBiometrics { [weak self] (success, error) in
                if success {
                    self!.navigateToHome()
                } else {
                    if let error = error {
                        self!.alertOnEmptyFields(message: "Biometric authentication failed: \(error.localizedDescription)")
                    }
                }
            }
        } else {
            alertOnEmptyFields(message: validationResult.message ?? "Invalid credentials.")
        }
    }
    
    /// Function to get the basic UI layout.
    func UISetup() {
        backGroundImage.layer.cornerRadius = 20
        backGroundImage.clipsToBounds = true
    }
    
    /// This function is called when the keyboard is about to be displayed.
    ///It checks the size of the keyboard using information from the notification.
    /// - Parameter notification: notification on clicking the textfields.
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    /// This implementation is commonly used to handle the keyboard covering the text input fields in a view, ensuring a smooth user experience.
    /// - Parameter notification: notification on clicking the textfields.
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    /// Function  to perform  navigation to Signup viewcontroller.
    func tapSignup() {
        performSegue(withIdentifier: "Signupviewcontroller", sender: UIButton.self)
    }
    
    /// Function to  perform navigaion to HomeviewController.
    func navigateToHome() {
        guard   let HomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController else {
            return
        }
        self.navigationController?.pushViewController(HomeView, animated: true)
    }
    
    /// Functions to display alert on empty fields.
    /// - Parameter message: Message based on the vacancy of the specfic  fields.
    func alertOnEmptyFields(message:String){
        let okButton = UIAlertAction(title: "OK", style: .default)
        let emptyFields = UIAlertController(title: "Empty Fields", message:message , preferredStyle: .alert)
        emptyFields.addAction(okButton)
        present(emptyFields, animated: true)
    }
    
    /// Function to check userAuthentication via face ID.
    func authenticationOnBiometrics(){
        let context = LAContext()
        var error:NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        {
            let reason = "explaination of Authentication"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ [self] success , authenticationError in
                if  success{
                    self.alertOnBiometric(with: "Authentication Successfull.")
                } else {
                }
                print("Authentication failed.")
            }
        }
        else {
            self.alertOnBiometric(with: "Authentication not available")
        }
    }
    
    /// Alert on Biometric Authentication.
    /// - Parameter message: Based on the authentication related message is prompted to the user.
    private func alertOnBiometric(with message: String){
        let alertMessage = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true)
        
    }
   
    deinit {
          // Unregister from keyboard notifications
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
      }
    
    /// Function to navigate to the Signupviewcontroller.
    func navigateToSignup(){
        guard let rootView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        else {
            return
        }
        navigationController?.pushViewController(rootView, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    /// UItextfield  delegate method .
    /// - Parameter textField:UITextField
    /// - Returns: Bool
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
