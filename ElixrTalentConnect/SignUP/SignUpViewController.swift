//
//  SignUpViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 12/01/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    /// Referencing Outlets.
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var promptSignup: UILabel!

    /// Variable Declaration.
    var Dataheading :[String]?
    var firstCellPlaceholder:String?
    var modelInfoKey = CandidateInfo()
    let cellTypes: [dataModel] = [dataModel.FullName,dataModel.EmailAdress,dataModel.Password,dataModel.confirmPassword]
    let textToChangeColor = "Sign in."
let userInfoPrompt = "Already have an account?Sign in."
    /// View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .highlighted)
        backButton.tintColor = UIColor.gray
        SigupPromptSetup()
    }
    
    @IBAction func returnAction(_ sender: UIButton) {
        
        guard let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        navigationController?.pushViewController(signInVC, animated: true)
    }
    func SigupPromptSetup(){
        let range = (userInfoPrompt as NSString).range(of: textToChangeColor)
        let attributedText = NSMutableAttributedString.init(string: userInfoPrompt)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0) , range: range)
        promptSignup.attributedText = attributedText
        let signInGesture = UITapGestureRecognizer(target: self, action:#selector(signUpAction(gesture: ) ))
        promptSignup.isUserInteractionEnabled = true
        promptSignup.addGestureRecognizer(signInGesture)
    }
    @objc func  signUpAction(gesture: UITapGestureRecognizer ){
        let termsRange = (userInfoPrompt as NSString).range(of: self.textToChangeColor)
        promptSignup.isUserInteractionEnabled = true
        if gesture.didTapAttributedTextInLabel(label: promptSignup, inRange: termsRange) {
            print("tapped")
            guard let rootView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
            else {
                return
            }
            navigationController?.pushViewController(rootView, animated: true)
        }
    }
}




