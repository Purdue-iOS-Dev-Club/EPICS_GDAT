//
//  LocalStorageViewController.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 10/26/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class LocalStorageViewController: UIViewController {


    @IBAction func onAddRoute(_ sender: Any) {
        
    }
    @IBOutlet weak var bus1Label: UILabel!
    @IBOutlet weak var bus2Label: UILabel!
    @IBOutlet weak var bus3Label: UILabel!
    @IBOutlet weak var bus4Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
