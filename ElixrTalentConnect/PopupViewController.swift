//
//  PopupViewController.swift
//  ElixrTalentConnect
//
//  Created by Devasurya on 23/01/24.
//

import UIKit

///PopupViewController - Pops up the result of  search function.
class PopupViewController: UIViewController {
    
    /// Referencing Outlets
    @IBOutlet weak var descriptionFetched: UILabel!
    @IBOutlet weak var locationFetched: UILabel!
    @IBOutlet weak var jobPosition: UILabel!
    /// Variable declarations
    var displayData:[Jobs] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
