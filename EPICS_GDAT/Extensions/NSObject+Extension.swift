//
//  NSObject+Extension.swift
//  EPICS_GDAT
//
//  Created by Ryuji Mano on 12/5/17.
//  Copyright © 2017 Siraj Zaneer. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return type(of: self).className
    }

    class var className: String {
        return String(describing: self)
    }
}
