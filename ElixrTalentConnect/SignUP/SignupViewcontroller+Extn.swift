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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            guard let basicInfo = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplay else{
                return ProfileDisplay()
            }
            basicInfo.userName.text = modelInfoKey.candidateName
            basicInfo.profileImage.image = UIImage(systemName: "person")
            
            return basicInfo
        case 1:
            guard let detailedView = tableView.dequeueReusableCell(withIdentifier: "EmailDisplayTableView") as? EmailDisplayTableView else {
                return EmailDisplayTableView()
            }
            detailedView.emailAddress.text = modelInfoKey.candidateMail
            return detailedView
        
        default:
            print("error")
            return UITableViewCell()
        }
     }
    
    
}
