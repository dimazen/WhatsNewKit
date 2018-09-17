//
//  WhatsNewViewController+TitleView.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 06.06.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

public extension WhatsNewViewController {
    
    /// The TitleView
    struct TitleView: Equatable {
        
        /// Weight of the TitleView on the screen.
        /// Describes relative amount of space occupied by the component
        public var weight: CGFloat = 0.2
        
        public var relativePadding: CGFloat
        
        /// The title font
        public var titleFont: UIFont
        
        /// The title color
        public var titleColor: UIColor
        
        public var titleAlignment: NSTextAlignment
        
        /// The subtitle font
        public var subtitleFont: UIFont
        
        /// The subtitle color
        public var subtitleColor: UIColor
        
        public var subtitleAlignment: NSTextAlignment
        
        /// The Animation
        public var animation: Animation?
        
        /// Default initializer
        ///
        /// - Parameters:
        ///   - titleFont: The title font. Default value `size: 30, weight: semibold`
        ///   - titleColor: The title color. Default value `.black`
        ///   - animation: The Animation. Default value `nil`
        public init(
            titleFont: UIFont = .systemFont(ofSize: 30, weight: .semibold),
            titleColor: UIColor = .black,
            titleAlignment: NSTextAlignment = .center,
            subtitleFont: UIFont = .systemFont(ofSize: 15, weight: .medium),
            subtitleColor: UIColor = .black,
            subtitleAlignment: NSTextAlignment = .center,
            relativePadding: CGFloat = 0.1,
            animation: Animation? = nil) {
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.titleAlignment = titleAlignment
            self.subtitleFont = subtitleFont
            self.subtitleColor = subtitleColor
            self.subtitleAlignment = subtitleAlignment
            self.relativePadding = relativePadding
            self.animation = animation
        }
        
    }
    
}
