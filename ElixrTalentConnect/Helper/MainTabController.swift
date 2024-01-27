//
//  MainTabController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 23/01/24.
//

import UIKit

/// MainTabController -is of type UITabBarController.
class MainTabController: UITabBarController {
    
    /// Override method from UITabBarController to customise tabbar .
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeRadiusOfTabbar()
        changeUnSelectedColor()
        ChangeHeightOfTabbar()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    /// ChangeRadiusOfTabbar -  this function changes the Border related aspects of the tabbar.
    func ChangeRadiusOfTabbar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    /// Function to set selected item tiny  color in  tabbar.
    func changeUnSelectedColor(){
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2062994838, green: 0.1383746266, blue: 0.3205983043, alpha: 1)
    }
    
    /// This function is responsible for changing the height related attribute of the tabbar.
    func ChangeHeightOfTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame  = tabBar.frame
            tabFrame.size.height = 100
            tabFrame.origin.y = view.frame.size.height - 100
            tabBar.frame = tabFrame
        }
    }
}
