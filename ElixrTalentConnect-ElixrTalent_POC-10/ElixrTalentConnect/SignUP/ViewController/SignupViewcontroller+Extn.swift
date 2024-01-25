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
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileDisplay") as? ProfileDisplayCell else{
            return UITableViewCell()
        }
        let dataCell = viewModalInstance.cellTypes[indexPath.row]
        profileCell.configure(with: dataCell)
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
}

