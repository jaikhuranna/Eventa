//
//  getTaglineViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 03/02/25.
//

import UIKit

class getTaglineViewController: UIViewController {
 
    static var NameforLabel:String!
    
    @IBOutlet var NameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTaglineViewController.NameforLabel = "Guy"
        NameLabel.text  = getTaglineViewController.NameforLabel
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
