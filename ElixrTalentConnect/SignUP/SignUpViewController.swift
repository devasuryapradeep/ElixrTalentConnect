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
        
        guard let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            return
        }
        navigationController?.pushViewController(signInVC, animated: true)
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


