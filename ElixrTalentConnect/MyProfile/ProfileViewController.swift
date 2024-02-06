//
//  ProfileViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 05/02/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var imageEditButton: UIButton!
    
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       UISetup()
    }
    
    func  UISetup(){
        userImage.layer.borderWidth = 1
          userImage.layer.masksToBounds = false
          userImage.layer.borderColor = UIColor.white.cgColor
          userImage.layer.cornerRadius = userImage.frame.height/2
          imageEditButton.clipsToBounds = true
        imageEditButton.layer.borderWidth = 1
          imageEditButton.layer.masksToBounds = false
          imageEditButton.layer.borderColor = UIColor.white.cgColor
          imageEditButton.layer.cornerRadius = imageEditButton.frame.height/2
          imageEditButton.clipsToBounds = true
    }
}
