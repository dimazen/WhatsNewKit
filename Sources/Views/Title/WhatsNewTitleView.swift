//
//  WhatsNewTitleView.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewTitleView
class WhatsNewTitleView: UIView {
    
    // MARK: Properties
    
    /// The WhatsNew Title
    private let title: String
    
    /// The WhatsNew Subtitle
    private let subtitle: String?
    
    /// The Configuration
    private let configuration: WhatsNewViewController.Configuration
    
    /// Bool has animated
    private var hasAnimated = false

    /// The title label
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = configuration.titleView.titleAlignment
        label.lineBreakMode = .byWordWrapping
        label.font = self.configuration.titleView.titleFont
        label.textColor = self.configuration.titleView.titleColor
        return label
    }()
    
    /// The title label
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = self.subtitle
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = configuration.titleView.subtitleAlignment
        label.lineBreakMode = .byWordWrapping
        label.font = self.configuration.titleView.subtitleFont
        label.textColor = self.configuration.titleView.subtitleColor
        return label
    }()
    
    // MARK: Initializer
    
    /// Default initializer
    ///
    /// - Parameters:
    ///   - title: The Title
    ///   - configuration: The Configuration
    init(title: String,
         subtitle: String?,
         configuration: WhatsNewViewController.Configuration) {
        // Set title
        self.title = title
        self.subtitle = subtitle
        // Set configuration
        self.configuration = configuration
        // Super init
        super.init(frame: .zero)
        // Set background color
        self.backgroundColor = self.configuration.backgroundColor
        // Add title label
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
    }
    
    /// Initializer with Coder always returns nil
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: View-Lifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // Initialize label height
        // Check if TitleLabel frame is not empty and hasn't animated
        if self.titleLabel.frame != .zero && !self.hasAnimated {
            let settings = WhatsNewViewController.Animation.AnimatorSettings(
                preferredDuration: 0.5,
                preferredDelay: 0.2
            )
            
            // Perform animation if available
            self.configuration.titleView.animation?.rawValue(self.titleLabel, settings)

            if self.subtitleLabel.frame != .zero {
                self.configuration.titleView.animation?.rawValue(self.subtitleLabel, settings)
            }
            // Set animated true
            self.hasAnimated = true
        }
        
        let height = self.frame.height
        
        let titleFrame: CGRect
        let subtitleFrame: CGRect
        if subtitle != nil {
            let titleHeight = floor(height * 0.4)
            let subtitleHeight = floor(height * 0.4)
            
            titleFrame = CGRect(
                x: 0,
                y: height - titleHeight - subtitleHeight,
                width: self.frame.width,
                height: titleHeight
            ).insetBy(dx: layoutMargins.left, dy: 0)
            subtitleFrame = CGRect(
                x: 0,
                y: height - subtitleHeight,
                width: self.frame.width,
                height: subtitleHeight
            ).insetBy(dx: layoutMargins.left, dy: 0)
        } else {
            let titleHeight = floor(height * 0.7)
            titleFrame = CGRect(
                x: 0,
                y: height - titleHeight,
                width: self.frame.width,
                height: titleHeight
            )
            subtitleFrame = .zero
        }
        
        // Set title label frame
        self.titleLabel.frame = titleFrame
        self.subtitleLabel.frame = subtitleFrame
    }
    
}
