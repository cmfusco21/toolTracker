//
//  Extentions+ Device.swift
//  ToolTracker
//
//  Created by Christopher Fusco on 8/4/23.
//

import Foundation
import UIKit
extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

