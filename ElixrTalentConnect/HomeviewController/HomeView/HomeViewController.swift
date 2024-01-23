//
//  HomeViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 14/01/24.
//

import UIKit
protocol SearchCompleted {
    func  fetchedData(filteredData:[Jobs])
}
/// HomeviewController is the view controller where the users is able to see the job oppprtunities in uikit
class HomeViewController: UIViewController {

    
    /// Variable and constant Declarations.
    var viewModal = JobViewModal()
    var isOn:Bool = false
      var searchbarInstance:SearchCompleted?
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
    
    @IBAction func searchFunctionality(_ sender: UITextField) {
        if let searchText = sender.text{
            
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
extension HomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hide the keyboard
        performSearch(with: customSearchbar.text)
        return true
    }
    
    // Replace this method with your actual search logic
    func performSearch(with searchTerm: String?) {
        guard let searchTerm = searchTerm, !searchTerm.isEmpty else {
            return
        }
        viewModal.fiterData(with: searchTerm)
        viewModal.searchedData = viewModal.filterDataItem
        searchbarInstance?.fetchedData(filteredData: viewModal.searchedData)
    }
}
extension HomeViewController :SearchCompleted {
    func fetchedData(filteredData: [Jobs]) {
        <#code#>
    }
    
    func onCompletingSearch(filteredData :[Jobs]){
        if let popupViewController = storyboard?.instantiateViewController(withIdentifier: "popupViewController") as? PopupViewController{
            popupViewController.displayData = filteredData
        }
    }
}
