//
//  LanguageTableViewController.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 12/2/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class LanguageTableViewController: UITableViewController {
    
    @IBAction func backButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //@IBOutlet var tableView: UITableView!
    var languages: [String] = ["English (Irish)", "Language 2", "Language 3", "Language 4", "Language 5"]
    
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
        return self.languages.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView!.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        cell.textLabel?.text = self.languages[indexPath.row]
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Light", size:20)
        cell.textLabel?.textColor = UIColor.lightGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell  #\(indexPath.row)")
    }
    
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



