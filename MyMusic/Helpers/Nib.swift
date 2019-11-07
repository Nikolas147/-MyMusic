//
//  Nib.swift
//  MyMusic
//
//  Created by Aleksey on 07/11/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
