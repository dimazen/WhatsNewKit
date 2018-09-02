//
//  WhatsNewViewController+Gradient.swift
//  WhatsNewKit-iOS
//
//  Created by Dima Vorona on 31/08/2018.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

extension WhatsNewViewController {
    
    /// Description of the Gradient color
    public struct Gradient: Equatable {

        /// Start point of the Gradient in uniform values. Default is 0, 0.
        public var startPoint: CGPoint
        
        /// End point of the Gradient in uniform values. Default is 0, 1.
        public var endPoint = CGPoint(x: 0, y: 1)
        
        /// Colors used in Gradient. Defaults is empty.
        public var colors: [UIColor] = []
        
        public init(
            startPoint: CGPoint = CGPoint(x: 0, y: 0),
            endPoint: CGPoint = CGPoint(x: 0, y: 1),
            colors: [UIColor] = []
        ) {
            self.startPoint = startPoint
            self.endPoint = endPoint
            self.colors = colors
        }
    }
}
