//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// Variable declaration
    var stringOne = "Don't have an account? Sign up"
    var stringTwo = "Sign up"
    
    /// Refercing  Outlets
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var signInPromptLabel: UILabel!
    @IBOutlet weak var credentialView: UIImageView!
    
    /// View Life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
    }
    
    
    /// Function to get the basic layout.
    func UISetup(){
        credentialView.layer.cornerRadius = 20
        credentialView.clipsToBounds = true
       
        outerView.layer.cornerRadius = 20
        outerView.layer.shadowColor = UIColor.gray.cgColor
        outerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        outerView.layer.shadowRadius = 20
        outerView.layer.shadowOpacity = 0.7
    }
    
    let myLabel = UILabel()
    var strOne = "Swift 3 has come"
    let strTwo = "has"
    let label = UILabel()
    let stringValue = "There are 5 results."
    let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
    attributedString.setColor(color: UIColor.red, forText: "5")
    label.font = UIFont.systemFont(ofSize: 26)
    label.attributedText = attributedString
    self.view.addSubview(label)
}
