//  JobDisplayTableViewCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 21/01/24.
//

import UIKit

/// JobDisplayTableViewCell is the place where all datas related to tableview cell is shown, and referenced.
class JobDisplayTableViewCell: UITableViewCell {
    
    /// Referencing Outlets
    @IBOutlet weak var DisplayView: UIViewSetUp!
    @IBOutlet weak var jobdetails: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var jobHeading: UILabel!
    @IBOutlet weak var deadlineDate: UILabel!
    
    /// Variable Declarattion
    var viewModalData = JobViewModel()
    var isOn : Bool = true
    var  favouriteArray :[Jobs] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// cellData- To assign th tablevalues with data from data model.
    /// - Parameter dataItem: dataItem is of type Jobs.
    func cellData(with dataItem:Jobs){
        jobHeading.text = dataItem.title
        jobLocation.text = dataItem.location
        jobdetails.text = dataItem.description
        
        guard let formattedDate  = viewModalData.formattingFunction(_dateString: dataItem.deadlineDate) else {
            return
        }
        deadlineDate.text = formattedDate
    }
}



