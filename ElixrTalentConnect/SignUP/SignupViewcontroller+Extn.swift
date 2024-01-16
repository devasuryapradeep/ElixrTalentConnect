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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplay else{
            return UITableViewCell()
        }
        let dataView = cellTypes[indexPath.row]
        profileCell.userNametitle.text = dataView.title
        profileCell.userName.placeholder = dataView.textTitle
        profileCell.profileImage.image = UIImage(named: dataView.icon)
        profileCell.profileImage.tintColor = UIColor(red: 228/255, green: 118/255, blue: 75/255, alpha: 1.0)
        if indexPath.row == 2 && indexPath.row == 3{
            if let image = UIImage(systemName:"eye.fill") {
                profileCell.hideButton.setImage(image, for: .highlighted)
            }
        }
        return profileCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
    // Create a custom cell class that inherits from UITableViewCell
}
