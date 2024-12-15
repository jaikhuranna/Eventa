//
//  AddEventViewController.swift
//  Eventa Organiser
//
//  Created by Jai Khurana on 15/12/24.
//

import UIKit

class AddEventViewController: UIViewController {
    
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var nameTextFeild: UITextField!
    
    @IBOutlet var descriptionTextFeild: UITextField!
    
    @IBOutlet var taglineTextFeild: UITextField!
    
    @IBOutlet var costTextFeild: UITextField!
    
    @IBOutlet var startDatePicker: UIDatePicker!
    
    @IBOutlet var endDatePicker: UIDatePicker!
    
    static var eventTitle : String = String()
    static var eventDescription : String = String()
    static var eventTagline : String = String()
    static var eventCost : Int = Int()
    static var eventStartDate : Date = Date()
    static var eventEndDate : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func pressNextButton(_ sender: Any) {
        AddEventViewController.eventTitle = nameTextFeild.text!
        AddEventViewController.eventDescription = descriptionTextFeild.text!
        AddEventViewController.eventTagline = taglineTextFeild.text!
        AddEventViewController.eventCost = Int(costTextFeild.text!) ?? 0
        AddEventViewController.eventStartDate = startDatePicker.date
        AddEventViewController.eventEndDate = endDatePicker.date
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
