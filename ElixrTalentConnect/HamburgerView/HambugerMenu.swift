//
//  dashBoardViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 26/01/24.
//

import UIKit

/// dashBoardViewController - To present dashboard(Sidemenu)
class HambugerMenu: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    /// Variable Declarations.
    var titleHeadings = ["About Us","Contact Us","Change Password","Privacy Policy","Terms & Conditions"]
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleHeadings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItems = tableView.dequeueReusableCell(withIdentifier: "DashBoardCell")as? HamburgerCell else {
            return UITableViewCell()
        }
        menuItems.dashMenuTitles.text = titleHeadings[indexPath.row]
        return menuItems
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! HamburgerCell
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
