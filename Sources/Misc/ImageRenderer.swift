//
//  ImageRenderer.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 25.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import Foundation
import UIKit

final class ImageRenderer {
    
    class func renderImageOfColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
    
    class func renderGradientOfSize(_ size: CGSize, gradient: WhatsNewViewController.Gradient) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let cgColors = gradient.colors.map({ $0.cgColor }) as CFArray
        
        guard
            let context = UIGraphicsGetCurrentContext(),
            let cgGradient = CGGradient(colorsSpace: colorSpace, colors: cgColors, locations: nil)
        else
        {
            return nil
        }
    
        let start = CGPoint(x: size.width, y: size.height) * gradient.startPoint
        let end = CGPoint(x: size.width, y: size.height) * gradient.endPoint
        
        context.drawLinearGradient(
            cgGradient,
            start: start.uniformed(),
            end: end.uniformed(),
            options: []
        )
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}
