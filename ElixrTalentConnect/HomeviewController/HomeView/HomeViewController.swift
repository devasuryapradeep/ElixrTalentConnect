//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModal = JobViewModal()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var jobDisplayTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getJobs()
    }
    
    /// get Jobs
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
                // show error saying api failed
            }
        }
    }
}
