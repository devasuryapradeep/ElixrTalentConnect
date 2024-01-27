//
//  dashBoardViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 26/01/24.
//

import UIKit

/// dashBoardViewController - To present dashboard(Sidemenu)
class dashBoardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    /// Variable Declarations.
    var titleHeadings = ["About Us","Contact Us","Change Password","Privacy Policy","Terms & Conditions"]
    
    /// numberOfRowsInSection
    /// - Parameters:
    ///   - tableView: To declare Number of rows needed for the tableview
    ///   - section: Type Int
    /// - Returns: A interger value on the count of values in the array.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleHeadings.count
    }
    
    /// cellForRowAt
    /// - Parameters:
    ///   - tableView: Register cell file to the tableview .and to customise the tableview UI elements.
    ///   - indexPath: Index path  of the tableview
    /// - Returns: UItableviewCell()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItems = tableView.dequeueReusableCell(withIdentifier: "DashBoardCell")as? DashBoardCell else {
            return UITableViewCell()
        }
        menuItems.dashMenuTitles.text = titleHeadings[indexPath.row]
        return menuItems
    }
    
    /// didSelectRowAt
    /// - Parameters:
    ///   - tableView: To perform a selection Action on tapping
    ///   - indexPath: indexpath of the tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! DashBoardCell
        cell.dashMenuTitles.backgroundColor = UIColor.white
        cell.titleView.backgroundColor = UIColor(red: 50/255, green: 36/255, blue: 79/255, alpha: 1.0)
        cell.dashMenuTitles.backgroundColor = UIColor(red: 50/255, green: 36/255, blue: 79/255, alpha: 1.0)
        cell.dashMenuTitles.textColor = UIColor.white
    }
    
    /// View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
