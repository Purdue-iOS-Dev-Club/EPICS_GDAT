//
//  ViewController.swift
//  EPICS_GDAT
//
//  Created by Siraj Zaneer on 10/26/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Avenir", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

