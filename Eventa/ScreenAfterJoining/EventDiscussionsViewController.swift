//
//  EventDiscussionsViewController.swift
//  screenAfterJoining
//
//  Created by Vinod P on 18/11/24.
//

import UIKit

class EventDiscussionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var discussionsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        discussionsTable.register(UITableViewCell.self , forCellReuseIdentifier: "discussionsCell")
        discussionsTable.delegate = self
        discussionsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discussionsCell",for:indexPath)
        cell.textLabel?.text = "Event1 Discussions"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //show chat messages
        let vc = ChatViewController()
        vc.title = "Event1 Discussions"
        navigationController?.pushViewController(vc, animated: true)
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
