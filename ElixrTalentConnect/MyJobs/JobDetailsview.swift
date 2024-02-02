//
//  JobDetailsview.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 30/01/24.
//

import UIKit

class JobDetailsview: UIViewController {
    
    /// Variable decalarations.
    var  jobInfoDescription :Jobs?
    var wishListVariable :String?
    
    /// Referencing Outlets.
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var typeOfJob: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var jobLevel: UILabel!
    @IBOutlet weak var jobDescription: UILabel!
    @IBOutlet weak var responsibilitiesDescription: UILabel!
    @IBOutlet weak var qualificationDescription: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        actionOnCheck()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataConfigure()
    }
    
    /// Function that renders data and presents data to the UI.
    func dataConfigure(){
        guard let jobInfoDescription = jobInfoDescription else {
            return
        }
        jobTitle.text = jobInfoDescription.title
        location.text = jobInfoDescription.location
        jobLevel.text = "-"
        jobDescription .text = jobInfoDescription.description
        responsibilitiesDescription.text = jobInfoDescription.responsibilities
        qualificationDescription.text =
        jobInfoDescription.requirements
        wishListVariable = jobInfoDescription.id
    }
    
    @IBAction func ApplyForJob(_ sender: UIButton) {
        conformationPrompt()
    }
    
    func conformationPrompt(){
        let messageIndicatior = UIAlertAction(title: "OK", style: .default)
        let conformationAlert = UIAlertController(title: "Job request Successful.", message: "Your job request has been sent.", preferredStyle: .alert)
        conformationAlert.addAction(messageIndicatior)
        present(conformationAlert, animated: true)
    }
    
    @IBAction func FavoriteButtonAction(_ sender: UIButton) {
        checkifValuePresent()
        actionOnCheck()
    }
    
    func checkifValuePresent(){
        guard let uniqueJobId = wishListVariable else {
            return
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        UserDefaults.standard.set(!isWishList, forKey: uniqueJobId)
    }
    func actionOnCheck (){
        guard let uniqueJobId =  wishListVariable else{
            return
        }
        let isWishList = UserDefaults.standard.bool(forKey: uniqueJobId)
        if isWishList{
            favouriteButton.setImage(UIImage(named: "heart.fill"), for: .normal)
        }
        else{
            favouriteButton.setImage(UIImage(named: "heart"), for: .normal)
        }
    }
}
