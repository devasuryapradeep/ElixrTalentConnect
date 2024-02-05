//
//  AppliedJobCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 04/02/24.
//

import UIKit

class AppliedJobCell: UITableViewCell {
    
    // MARK: - Varaible Declarations.
    var  viewInstance = MyjobsViewController()
    
    // MARK: - IBOutlets.
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureData(dataitem : Jobs){
        jobTitle.text = dataitem.title
        jobDescription.text = dataitem.description
        jobLocation.text = dataitem.location
    }
}
