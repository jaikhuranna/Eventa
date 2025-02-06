//
//  SearchViewController.swift
//  Eventa
//
//  Created by Jai Khurana on 06/02/25.
//

import UIKit

class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        DataModel.lastResultEvents = DataModel.events // Clear results if empty
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataModel.lastResultEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = DataModel.lastResultEvents[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchEvents") as? SearchEventsTableViewCell {
            cell.EventNamelabel.text = event.title
            cell.dateLabel.text = event.date.formatted()
            cell.taglineLabel.text = event.tagline
            cell.eventImage.image = UIImage(named: event.imageURL)
            cell.eventImage.layer.cornerRadius = 10
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventToSend : Event = DataModel.lastResultEvents[indexPath.row]
        EventDetailsViewController.eventToShow = eventToSend
        let storyboard = UIStoryboard(name: "New_Explore", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "EventDetailsViewController") as? EventDetailsViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DataModel.lastResultEvents = DataModel.events // Clear results if empty
            tableView.reloadData()
            return
        }
        
        DataModel.searchEvents(queryText: searchText) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
