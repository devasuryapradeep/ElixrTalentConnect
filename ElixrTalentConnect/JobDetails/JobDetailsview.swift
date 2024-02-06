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
    var appliedJobInstance = MyjobsViewController()
    
    /// Referencing Outlets.
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var typeOfJob: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var userImage: UIImageView!
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
        userImage.layer.cornerRadius = userImage.frame.width / 2
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
        applyJob()
    }
    func applyJob1() {
        guard let jobInfoDescription = jobInfoDescription else { return }
        var savedJobs = UserDefaults.standard.array(forKey: .userKey) as? [[String: Any]] ?? []
        savedJobs.append(["id": jobInfoDescription.id ?? " ", "title": jobInfoDescription.title, "description": jobInfoDescription.description, "location": jobInfoDescription.location]) //
    }

    func applyJob() {
        var savedJobs = getSavedJobs()
        guard let jobInfoDescription = jobInfoDescription, !isJobAlreadyApplied(savedJobs, job: jobInfoDescription) else {
            print("Job has already been applied for.")
            showAlert(message: "Job already applied")
            return
        }
        savedJobs.append(jobInfoDescription)
        do {
            let appliedJobsData = try JSONEncoder().encode(savedJobs)
            UserDefaults.standard.set(appliedJobsData, forKey: .userKey)
        } catch {
            showAlert(message: "Job Applied")
        }
    }
    
    func getSavedJobs() -> [Jobs] {
        guard let savedJobData = UserDefaults.standard.data(forKey: .userKey),
              let savedJobs = try? JSONDecoder().decode([Jobs].self, from: savedJobData) else {
            return []
        }
        
        return savedJobs
    }
    
    func isJobAlreadyApplied(_ savedJobs: [Jobs], job: Jobs) -> Bool {
        guard !savedJobs.isEmpty else {
            return false
        }
        let isApplied = savedJobs.contains(where: { $0.id == job.id })
        return isApplied
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    //MARK: - @IBAction For Favourite button action.
    @IBAction func FavoriteButtonAction(_ sender: UIButton) {
        checkifValuePresent()
        actionOnCheck()
    }
    
    // MARK: - Functions to  perform Favourite Button action.
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

