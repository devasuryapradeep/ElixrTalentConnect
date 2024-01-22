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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(with dataItem :SignupDataModel){
        userNametitle.text = dataItem.title
        userName.placeholder = dataItem.placeHolder
        if dataItem == .password {
            privacyButton.isHidden = !userName.isEditing
            privacyButton.setImage(UIImage(systemName: "eye"), for: .highlighted)
        } else {
            privacyButton.isHidden = true
            privacyButton.setImage(UIImage(systemName: "eye.slash"), for: .highlighted)
        }
        profileImage.image = UIImage(systemName: dataItem.icon)
    }
}
