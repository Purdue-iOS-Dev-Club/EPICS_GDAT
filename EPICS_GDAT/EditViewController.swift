//
//  EditViewController.swift
//  EPICS_GDAT
//
//  Created by Siraj Zaneer on 11/30/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class EditViewController: UITableViewController {

    var routes: [Int]!
    var delegate: SpeechViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.setEditing(true, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return routes.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            routes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            delegate.reload(routes: routes)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "Route"
        
        return cell
    }
}
