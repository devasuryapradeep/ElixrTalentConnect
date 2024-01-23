//
//  ProfileDisplay.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit

/// Cell file created to contain all cell related data of the SignupTableview.
class ProfileDisplayCell: UITableViewCell {
    
    /// Referencing Outlets.
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var userText: UILabel!
    /// View life cycle.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Configure- is the function that will fe
    func configure(with dataItem :SignupDataModel){
        userText.text = dataItem.title
        userInput.placeholder = dataItem.placeHolder
        profileImage.image = UIImage(systemName: dataItem.icon)
        if dataItem.isVisible{
            profileImage.image = UIImage(systemName: dataItem.icon)
            userInput.isSecureTextEntry = true
            privacyButton.tintColor = UIColor.gray
            privacyButton.setImage(UIImage(systemName: "eye"), for: .normal)
            privacyButton.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
            privacyButton.isHidden = false
        }
    }
    
    /// privacyButtonTapped -Fuction used to trigger the functionality of showing  and hiding the password.
    @objc func privacyButtonTapped () {
        userInput.isSecureTextEntry.toggle()
        if  let imageName = userInput.isSecureTextEntry ? "eye.slash" : "eye"{
            privacyButton.setImage(UIImage(systemName: imageName),for:.normal)
            privacyButton.tintColor = UIColor.gray
            privacyButton.isHidden = false
        }
    }
}

