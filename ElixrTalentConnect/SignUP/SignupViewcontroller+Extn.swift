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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
            
        
            guard let basicInfo = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplay else{
                return ProfileDisplay()
            }
            if indexPath.row == 0{
                basicInfo.userName.text = "fdmasf;e"
            }
            else {
                basicInfo.userName.text = "feddcsvdjsak"

            }

            return basicInfo
//        case 1:
//            guard let detailedView = tableView.dequeueReusableCell(withIdentifier: "EmailDisplayTableView") as? EmailDisplayTableView else {
//                return EmailDisplayTableView()
//            }
//            detailedView.emailAddress.text = modelInfoKey.candidateMail
//            return detailedView
//
//        default:
//            print("error")
//            return UITableViewCell()
//        }
     }
    
    
}
