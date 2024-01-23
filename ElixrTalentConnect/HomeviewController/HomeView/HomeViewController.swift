//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit
/// HomeviewController is the view controller where the users is able to see the job oppprtunities in uikit
class HomeViewController: UIViewController {
    
    /// Variable and constant Declarations.
    var viewModal = JobViewModal()
    
    /// Referencing Outlets.
    @IBOutlet weak var customSearchbar: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var jobDisplayTableView: UITableView!
    
    /// View llife cycle
    override func viewDidLoad() {
        customSearchbar.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        super.viewDidLoad()
        getJobs()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    /// get Jobs- This is to make  make View Controller connect with view Model and also responsible for updating the UI of the screen.
    func getJobs() {
        activityIndicator.startAnimating()
        viewModal.getJobsList { status in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
            }
            if status {
                DispatchQueue.main.async {
                    self.jobDisplayTableView.reloadData()
                }
            } else {
                showAlert()
            }
        }
        
        /// ShowAlert - Display the alert on failure while calling API.
        func showAlert(){
            let OkButton = UIAlertAction(title: "OK", style: .default)
            let alertDisplay = UIAlertController(title: "Alert", message: "Failure while calling API", preferredStyle: .alert)
            alertDisplay.addAction(OkButton)
            present(alertDisplay, animated: true)
        }
    }
}
