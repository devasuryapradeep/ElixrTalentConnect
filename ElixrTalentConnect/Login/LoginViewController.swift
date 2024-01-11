//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// Variable declaration
    var  userPrompt = "Don't have an account?Sign up"
    var TextToChangeColor = "Sign up."
    /// Refercing  Outlets
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var signInPromptLabel: UILabel!
    @IBOutlet weak var credentialView: UIImageView!
    
    /// View Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        labelSetup()
    }
    
    
    /// Function to get the basic UI layout.
    func UISetup(){
        credentialView.layer.cornerRadius = 20
        credentialView.clipsToBounds = true
        outerView.layer.cornerRadius = 20
        outerView.layer.shadowColor = UIColor.gray.cgColor
        outerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        outerView.layer.shadowRadius = 20
        outerView.layer.shadowOpacity = 0.7
        
    }
    func labelSetup(){
        var stringOne = "Don't have an account?Sign up"
        let stringTwo = "Sign up"
        
        let range = (stringOne as NSString).range(of: stringTwo)
        
        let attributedText = NSMutableAttributedString.init(string: stringOne)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue , range: range)
        signInPromptLabel.attributedText = attributedText
    }
}
    extension UILabel {
        func halfTextColorChange (fullText : String , changeText : String ) {
            let strNumber: NSString = fullText as NSString
            let range = (strNumber).range(of: changeText)
            let attribute = NSMutableAttributedString.init(string: fullText)
            attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0) , range: range)
            self.attributedText = attribute
        }
    }

