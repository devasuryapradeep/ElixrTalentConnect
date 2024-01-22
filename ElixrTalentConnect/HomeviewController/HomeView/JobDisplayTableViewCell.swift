//
//  JobDisplayTable.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import UIKit

class JobDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var DisplayView: UIViewSetUp!
    @IBOutlet weak var jobdetails: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobStatus: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var jobHeading: UILabel!
    
    /// Variable Declarattion
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
}
