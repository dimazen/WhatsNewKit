//
//  WhatsNewCompletionButton.swift
//  WhatsNewKit
//
//  Created by Sven Tiigi on 19.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

/// The WhatsNewRoundedButton
class WhatsNewRoundedButton: UIButton {
    
    // MARK: Properties
    
    /// The highlighted background color
    private var highlightedBackgroundColor: UIColor = .white
    
    /// The onPress closure
    private var onPress: (() -> Void)?
    
    private var gradient: WhatsNewViewController.Gradient?
    
    // MARK: Initializer
    
    /// Convenience initializer
    ///
    /// - Parameters:
    ///   - title: The title
    ///   - configuration: The Configuration
    ///   - onPress: The on press closure
    convenience init(title: String,
                     configuration: WhatsNewViewController.Configuration,
                     onPress: @escaping () -> Void) {
        // Init with Custom Type
        self.init(type: .custom)
        // Set onPress closure
        self.onPress = onPress
        // Set highlighted background color
        self.highlightedBackgroundColor = configuration.completionButton.backgroundColor
        self.gradient = configuration.completionButton.backgroundGradient
        // Set title
        self.setTitle(title, for: .normal)
        // Perform configuration
        self.configure(withConfiguration: configuration)
    }
    
    // MARK: ViewLifecycle
    
    /// Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        // Check if current background image is nil
        if self.currentBackgroundImage == nil {
            // Set the backgroundimage
            self.setBackgroundImage(
                self.renderImage(
                    color: self.highlightedBackgroundColor,
                    gradient: self.gradient,
                    size: self.bounds.size
                ),
                for: .normal
            )
        }
    }
    
    // MARK: Private API
    
    /// Perform configuration
    private func configure(withConfiguration configuration: WhatsNewViewController.Configuration) {
        // Set corner radius to rounded button
        self.layer.cornerRadius = configuration.completionButton.cornerRadius
        // Set mask to bound
        self.layer.masksToBounds = true
        // Set font
        self.titleLabel?.font = configuration.completionButton.titleFont
        // Set normal title color
        self.setTitleColor(configuration.completionButton.titleColor, for: .normal)
        // Set number of lines
        self.titleLabel?.numberOfLines = 0
        // Set line break mode
        self.titleLabel?.lineBreakMode = .byWordWrapping
        // Add target
        self.addTarget(
            self,
            action: #selector(self.didTouchUpInside),
            for: .touchUpInside
        )
    }
    
    /// Return a UIImage with a given UIColor and CGSize
    ///
    /// - Parameters:
    ///   - color: The color of the returned UIImage
    ///   - size: The size of the returned UIImage
    /// - Returns: Optional UIImage
    private func renderImage(
        color: UIColor,
        gradient: WhatsNewViewController.Gradient?,
        size: CGSize
    ) -> UIImage? {
        if let gradient = gradient {
            return ImageRenderer.renderGradientOfSize(size, gradient: gradient)
        } else {
            return ImageRenderer.renderImageOfColor(color, size: size)
        }
    }
    
    /// Button did touch up inside
    @objc private func didTouchUpInside() {
        // Invoke onPress closure
        self.onPress?()
    }
    
}
