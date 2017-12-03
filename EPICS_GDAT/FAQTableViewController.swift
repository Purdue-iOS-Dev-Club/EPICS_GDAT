//
//  FAQTableViewController.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 12/3/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class FAQTableViewController: UITableViewController {

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

    
    //@IBOutlet var tableView: UITableView!
    var questions: [String] = ["How does the app work?", "How do I select a route?", "How do I delete a route?", "How do I add a route?", "Question 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false;
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView!.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        cell.textLabel?.text = self.questions[indexPath.row]
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Light", size:20)
        cell.textLabel?.textColor = UIColor.lightGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell  #\(indexPath.row)")
    }
    
    
}
