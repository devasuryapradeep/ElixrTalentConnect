//
//  JobDisplayTable+Extn.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation
import UIKit
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("result on filteredArray-->\(viewModal.filteredJobs)")
        return customSearchbar.isEditing ? viewModal.filteredJobs.count:viewModal.jobDetails.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobItemCell = jobDisplayTableView.dequeueReusableCell(withIdentifier: "JobDisplayTableViewCell")as? JobDisplayTableViewCell else{
            return UITableViewCell()
        }
        if customSearchbar.isEditing{
            let jobsInfo = viewModal.filteredJobs[indexPath.row]
            jobItemCell.cellData(with: jobsInfo)
            return jobItemCell
        }
        let jobsInfocell = viewModal.jobDetails[indexPath.row]
        jobItemCell.cellData(with: jobsInfocell)
        
        return jobItemCell
    }
 
}





