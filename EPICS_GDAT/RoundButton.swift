//
//  RoundButton.swift
//  EPICS_GDAT
//
//  Created by Sruthi Pillai on 12/3/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
    self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
