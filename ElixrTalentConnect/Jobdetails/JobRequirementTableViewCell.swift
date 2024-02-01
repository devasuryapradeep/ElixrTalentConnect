//
//  JobRequirementTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 31/01/24.
//

import UIKit

class JobRequirementTableViewCell: UITableViewCell {
    var titles :[String] = ["Key responsiblities", "Qualifications"]
    var jobDisplayInstance = JobDetailsViewController()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureRequirements(dataitem :Jobs,indexpath:IndexPath){
        titleDescription.text = indexpath.row == 2 ? dataitem.responsibilities :dataitem.requirements
        titleLabel.text = titles[indexpath.row]
    }

}
