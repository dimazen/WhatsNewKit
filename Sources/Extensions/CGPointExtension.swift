//
//  CGPointExtension.swift
//  WhatsNewKit-iOS
//
//  Created by Dima Vorona on 31/08/2018.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import CoreGraphics

public func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}
