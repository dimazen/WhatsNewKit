//
//  CGFloatExtension.swift
//  WhatsNewKit-iOS
//
//  Created by Dima Vorona on 31/08/2018.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    
    func uniformed() -> CGFloat {
        return Swift.min(Swift.max(self, 0), 1)
    }
}
