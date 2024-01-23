//
//  ProfileDisplay.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit

class ProfileDisplayCell: UITableViewCell {
    
    /// Referencing Outlets.
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userNametitle: UILabel!
    /// View life cycle.
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            }
    func configure(with dataItem :SignupDataModel){
        userNametitle.text = dataItem.title
        userName.placeholder = dataItem.placeHolder
        if dataItem.isVisible{
            profileImage.image = UIImage(systemName: dataItem.icon)
            userName.isSecureTextEntry = true
            privacyButton.tintColor = UIColor.gray
            privacyButton.setImage(UIImage(systemName: "eye"), for: .normal)
            privacyButton.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
            privacyButton.isHidden = false
        }
    }
        @objc func privacyButtonTapped () {
            userName.isSecureTextEntry.toggle()
            if   let imageName = userName.isSecureTextEntry ? "eye.slash" : "eye"{
                privacyButton.setImage(UIImage(systemName: imageName),for:.normal)
                privacyButton.tintColor = UIColor.gray
                privacyButton.isHidden = false

            }
        }
    }

