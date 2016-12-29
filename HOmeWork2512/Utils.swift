//
//  Utils.swift
//  HOmeWork2512
//
//  Created by LuanNX on 12/27/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import Foundation
import UIKit
extension CGPoint {
    func distance(other : CGPoint) -> CGFloat {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return CGFloat(sqrt(dx * dx + dy * dy ))
    }
    func add(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}
extension String {
    func toDouble() -> Double {
        return NumberFormatter().number(from: self) as! Double
    }
    
}
