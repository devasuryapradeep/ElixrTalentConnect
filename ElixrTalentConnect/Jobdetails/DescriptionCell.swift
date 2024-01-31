//
//  DescriptionCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 31/01/24.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    /// Varaible declarations
    var  jodetailInstance =  JobDetailsView()
    
    /// Referencing Outlets.
    @IBOutlet weak var jobTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /// Function  to assign data to the table view Fields.
    /// - Parameter dataItem: The expected parameter is of type Jobs (DataModel).
   
}
