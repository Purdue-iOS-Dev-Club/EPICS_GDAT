//
//  LanguageViewController.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 12/1/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController {

    
    @IBAction func backButton(_ sender: Any) {
      
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        
    }
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
