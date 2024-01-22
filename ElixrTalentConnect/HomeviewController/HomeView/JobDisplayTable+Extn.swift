//
//  JobDisplayTable+Extn.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import Foundation
import UIKit
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("arrayCount--->",viewModal.jobDetails.count)
        return viewModal.jobDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobItemCell = jobDisplayTableView.dequeueReusableCell(withIdentifier: "JobDisplayTableViewCell")as? JobDisplayTableViewCell else{
            return UITableViewCell()
        }
        let jobs = viewModal.jobDetails[indexPath.row]
        jobItemCell.jobHeading.text = jobs.department
        jobItemCell.jobLocation .text = jobs.location
        jobItemCell.jobdetails.text = jobs.description
        jobItemCell.jobStatus.text = jobs.status
        return jobItemCell
    }
}
