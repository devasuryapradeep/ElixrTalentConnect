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
    var viewModal = JobViewModel()
    var isOn:Bool = false
    
    /// Referencing Outlets.
    @IBOutlet weak var customSearchbar: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var jobDisplayTableView: UITableView!
    
    /// View llife cycle
    override func viewDidLoad() {
        customSearchbar.delegate = self
        super.viewDidLoad()
        getJobs()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    /// searchFunctionality- this is to asign search functionality to the textfield called  custom textfield.
    /// - Parameter sender: UITextField
    @IBAction func searchFunctionality(_ sender: UITextField) {
        if let searchText = sender.text{
            viewModal.filteredData(with: searchText)
            jobDisplayTableView.reloadData()
        }
    }
    
    /// get Jobs- This is to make  make View Controller connect with view Model and also responsible for updating the UI of the screen.
    func getJobs() {
        activityIndicator.startAnimating()
        viewModal.getJobsList { [self] status in
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
    }
    
    /// ShowAlert - Display the alert on failure while calling API.
    func showAlert(){
        let OkButton = UIAlertAction(title: "OK", style: .default)
        let alertDisplay = UIAlertController(title: "Alert", message: "Failure while calling API", preferredStyle: .alert)
        alertDisplay.addAction(OkButton)
        present(alertDisplay, animated: true)
    }
}

// Extension on HomeViewController delgate methods.
extension HomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hide the keyboard
        performSearch(with: customSearchbar.text)
        return true
    }
    
    // Replace this method with your actual search logic
    func performSearch(with searchTerm: String?) {
        guard let searchTerm = searchTerm ,!searchTerm.isEmpty else {
            viewModal.resetSearch()
            jobDisplayTableView.reloadData()
            return
        }
        viewModal.filteredData(with: searchTerm)
        jobDisplayTableView.reloadData()
    }
}
