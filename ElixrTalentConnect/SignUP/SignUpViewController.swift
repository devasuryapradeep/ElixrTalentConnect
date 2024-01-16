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
    
    /// Variable Declaration.
    var Dataheading :[String]?
    var firstCellPlaceholder:String?
    var modelInfoKey = CandidateInfo()
    var profileIcon  = [ "person","envelope"]
    /// View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .highlighted)
    }
    
    @IBAction func returnAction(_ sender: UIButton) {
        
        guard let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
        navigationController?.pushViewController(signInVC, animated: true)
    }
}




