//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit

/// LoginViewcontroller contains  user authentication,sign-in ,sign-up.
class LoginViewController: UIViewController {
    
    /// Variables and constants  declaration
    public  let userInfoPrompt = "Don't have an account?Sign up"
    public  let TextToChangeColor = "Sign up"
    
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
    }
    
    /// Function to get the basic UI layout.
    func UISetup() {
        backGroundImage.layer.cornerRadius = 20
        backGroundImage.clipsToBounds = true
        signInPromptLabel.text = userInfoPrompt
        let range = (userInfoPrompt as NSString).range(of: TextToChangeColor)
        let attributedText = NSMutableAttributedString.init(string: userInfoPrompt)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0) , range: range)
        signInPromptLabel.attributedText = attributedText
        let signInGesture = UITapGestureRecognizer(target: self, action:#selector(signUpAction(gesture: ) ))
        signInPromptLabel.isUserInteractionEnabled = true
        signInPromptLabel.addGestureRecognizer(signInGesture)
        
    }
    @objc func signUpAction(gesture:UITapGestureRecognizer) {
        let termsRange = (userInfoPrompt as NSString).range(of: self.TextToChangeColor)
        // comment for now
        //let privacyRange = (text as NSString).range(of: "Privacy Policy")
        signInPromptLabel.isUserInteractionEnabled = true
        
        if gesture.didTapAttributedTextInLabel(label: signInPromptLabel, inRange: termsRange) {
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
    
    func tapSignup(){
        guard   let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else{
            return
        }
        navigationController?.pushViewController(homeVc, animated: true)
    }
    
    
    
}

