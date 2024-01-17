//
//  SignupViewcontroller+Extn.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 15/01/24.
//

import Foundation
import UIKit

extension SignUpViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    /// cellForRowAt function
    /// - Parameters:
    ///   - tableView: UItableview
    ///   - indexPath: indexPath
    /// - Returns: UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplay else{
            return UITableViewCell()
        }
        let dataView = cellTypes[indexPath.row]
        profileCell.userNametitle.text = dataView.title
        profileCell.userName.placeholder = dataView.textTitle
        profileCell.profileImage.image = UIImage(systemName: dataView.icon)
        profileCell.profileImage.tintColor = UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0)
        if indexPath.row == 2 && indexPath.row == 3{
            if let image = UIImage(systemName:"eye.fill") {
                profileCell.privacyButton.setImage(image, for: .highlighted)
                profileCell.privacyButton.isHidden = false
            }
        }
        return profileCell
    }
    
    /// HeightForRowAt
    /// - Parameters:
    ///   - tableView: UItableview
    ///   - indexPath: indexPath
    /// - Returns: Float type  value describes about the cell height.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // Create a custom cell class that inherits from UITableViewCell
}
