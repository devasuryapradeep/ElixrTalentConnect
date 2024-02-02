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
        return customSearchbar.isEditing ? viewModal.filteredJobs.count:viewModal.jobDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let jobItemCell = jobDisplayTableView.dequeueReusableCell(withIdentifier: "HomeInfoCell")as? HomeInfoCell else{
            return UITableViewCell()
        }
        let cellData  =  viewModal.getInfoCell(at: indexPath.row, isSearching: customSearchbar.isEditing)
        jobItemCell.cellData(with: cellData)
        return jobItemCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModal.getInfoCell(at: indexPath.row, isSearching: customSearchbar.isEditing)
        detailsViewNavigation(for: selectedCell)
    }
    func detailsViewNavigation (for jobDescription :Jobs){
        guard let detailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JobDetailsview")as?JobDetailsview else {
            return
        }
        detailsView.jobInfoDescription =  jobDescription
        navigationController?.pushViewController(detailsView, animated: true)
    }
}


