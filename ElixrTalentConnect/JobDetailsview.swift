//
//  JobDetailsview.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 30/01/24.
//

import UIKit

class JobDetailsview: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarSetup()
    }
    func tabbarSetup(){
        if let  tabbarVc =  storyboard?.instantiateViewController(withIdentifier: "TabBarViewController"){
            addChild(tabbarVc)
            view.addSubview(tabbarVc.view)
            tabbarVc.didMove(toParent: self)
            tabbarVc.tabBarController?.selectedIndex = 0
        }
    }
}
