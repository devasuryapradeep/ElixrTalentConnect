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
    public  let userInfoPrompt = "Don't have an account? Sign up"
    public  let textToChangeColor = " Sign up"
    private var viewModel : LoginViewModel!
    
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
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    /// SignIntapped is the IBaction of the button "signInButton", which trigers alert actions,validation
    /// - Parameter sender: UIbutton named "signInButton".
    @IBAction func SignInTapped(_ sender: UIButton){
        let loginModel = UserModel(userName: emailField.text , passwordValue:passwordField.text)
        let validationResult = viewModel.validateCredentials(model: loginModel)
        
        if validationResult.isValid {
            viewModel.authenticateWithBiometrics { [weak self] (success, error) in
                if success {
                    self!.navigateToHome()
                    
                } else {
                    if let error = error {
                        self!.showAlert(message: "Biometric authentication failed: \(error.localizedDescription)")
                    }
                }
            }
        } else {
            showAlert(message: validationResult.message ?? "Invalid credentials.")
        }
    }
        
        /// Function to get the basic UI layout.
        func UISetup() {
            backGroundImage.layer.cornerRadius = 20
            backGroundImage.clipsToBounds = true
            signInPromptLabel.text = userInfoPrompt
            let range = (userInfoPrompt as NSString).range(of: textToChangeColor)
            let attributedText = NSMutableAttributedString.init(string: userInfoPrompt)
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0) , range: range)
            signInPromptLabel.attributedText = attributedText
            let signInGesture = UITapGestureRecognizer(target: self, action:#selector(signUpAction(gesture: ) ))
            signInPromptLabel.isUserInteractionEnabled = true
            signInPromptLabel.addGestureRecognizer(signInGesture)
            
        }
        
        /// Function to setup SignUp action using gesture
        /// - Parameter gesture: Specific part in the UIlabel where tap gesture is added.
        @objc func signUpAction(gesture:UITapGestureRecognizer) {
            let termsRange = (userInfoPrompt as NSString).range(of: self.textToChangeColor)
            signInPromptLabel.isUserInteractionEnabled = true
            if gesture.didTapAttributedTextInLabel(label: signInPromptLabel, inRange: termsRange) {
                print("tapped")
                guard let rootView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
                else {
                    return
                }
                navigationController?.pushViewController(rootView, animated: true)
            }
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
            guard   let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else{
                return
            }
            navigationController?.pushViewController(homeVc, animated: true)
        }
        
        /// Function to  perform navigaion to HomeviewController.
        func navigateToHome() {
            guard   let HomeView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                return
            }
            self.navigationController?.pushViewController(HomeView, animated: true)
        }
        
        /// Function to display alert on empty .
        func showAlert(message:String){
            let ok = UIAlertAction(title: "OK", style: .default)
            let emptyFields = UIAlertController(title: "Empty Fields", message:message , preferredStyle: .alert)
            emptyFields.addAction(ok)
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
}