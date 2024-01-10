//
// LoginViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 10/01/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var credentialView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func UIUpdate(){
        credentialView.layer.shadowColor = UIColor.black.cgColor
        credentialView.layer.shadowOpacity = 1
          credentialView.layer.shadowOffset = CGSize.zero
        
    }
}

