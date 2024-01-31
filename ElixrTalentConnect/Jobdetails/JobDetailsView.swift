//
//  JobDetailsview.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 30/01/24.
//

import UIKit

class JobDetailsView: UIViewController {
    var jobInfoDescription :Jobs?
    /// View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension JobDetailsView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let detailsCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell")as? DescriptionCell else {
            return UITableViewCell()
        }
        if let jobInfoDescription = jobInfoDescription{
            detailsCell.jobTitle.text = jobInfoDescription.title
            print(jobInfoDescription.title)
        }
        return detailsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
