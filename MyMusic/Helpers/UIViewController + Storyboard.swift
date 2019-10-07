//
//  UIViewController + Storyboard.swift
//  MyMusic
//
//  Created by Aleksey on 07/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storydoard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storydoard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) storyboard!")
        }
    }
}
