//
//  MyjobsViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 04/02/24.
//

import UIKit

class MyjobsViewController: UIViewController {
    
   //MARK: - IBOutlets.
    @IBOutlet weak var appliedJobCell: UITableView!
    @IBOutlet weak var CustomSearchBar: UITextField!
    
    //MARK: - Variable Declarations.
     var arrayOfAppliedJobs : [Jobs] {
       
         return JobManager.shared.arrayOfJobs
         
     }
    
    //MARK: - View life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: - TableView  Methods.
extension MyjobsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfAppliedJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let displayCell  = tableView.dequeueReusableCell(withIdentifier: "AppliedJobCell")as? AppliedJobCell else {
            return UITableViewCell()
        }
        displayCell.configureData(dataitem: arrayOfAppliedJobs[indexPath.row])
        return displayCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}
