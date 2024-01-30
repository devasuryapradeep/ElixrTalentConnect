//
//  MainTabController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 23/01/24.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeRadiusOfTabBar()
        changeUnSelectedColor()
        ChangeHeightOfTabbar()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    func changeRadiusOfTabBar(){
        self.tabBar.layer.masksToBounds = true
             self.tabBar.isTranslucent = true
             self.tabBar.layer.cornerRadius = 30
             self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func changeUnSelectedColor(){
        self.tabBar.unselectedItemTintColor = UIColor.white
           }
    func ChangeHeightOfTabbar(){
      
          if UIDevice().userInterfaceIdiom == .phone {
              var tabFrame            = tabBar.frame
              tabFrame.size.height    = 100
              tabFrame.origin.y       = view.frame.size.height - 100
              tabBar.frame            = tabFrame
          }
      
         }
}
