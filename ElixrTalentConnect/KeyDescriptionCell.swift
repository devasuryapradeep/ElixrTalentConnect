//
//  KeyDescriptionCell.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 31/01/24.
//

import UIKit

class KeyDescriptionCell: UITableViewCell {

    /// Referencing Outlet.
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var DetailedDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureKeyDescription(dataitem:Jobs){
        descriptionTitle.text = "Description"
        DetailedDescription.text  = dataitem.description
    }
}
