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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DataModel.lastResultEvents = [] // Clear results if empty
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
