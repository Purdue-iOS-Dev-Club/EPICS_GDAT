//
//  BoardMenuController.swift
//  EPICS_GDAT
//
//  Created by Ryuji Mano on 12/5/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

class BoardMenuController: UIViewController {
    @IBOutlet weak var iconView: UIImageView! {
        didSet {
            iconView.layer.cornerRadius = iconView.frame.size.width / 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
