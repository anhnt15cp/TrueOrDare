//
//  ExtensionUiView.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation
import UIKit

private let rotationAnimationKey = "rotationAnimationKey"

extension UIView {
    
    func startRotation(duration: CFTimeInterval, repeatCount: Float, clockwise: Bool) {
        // this helped figure out how to start/stop from current rotation angle
        // instead of resetting each time
        // http://stackoverflow.com/a/38471346/234609
        
        // get the current rotation angle
        var currentRotationAngle: CGFloat = 0
        if let presentationLayer = layer.presentation(), let zValue = presentationLayer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            currentRotationAngle = zValue
        }
        
        // animate rotating the view 360 degrees
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = currentRotationAngle
        if clockwise {
            rotationAnimation.toValue = .pi * 2.0 + Double(currentRotationAngle)
        }
        else {
            rotationAnimation.toValue = -.pi * 2.0 + Double(currentRotationAngle)
        }
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = repeatCount
        layer.add(rotationAnimation, forKey: rotationAnimationKey)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            self.stopRotation()
//        }
    }
    
    /**
        Stops the UIView from rotating, and keeps it at the rotation angle it had when it stopped.
    */
    func stopRotation() {
        // get the current rotation angle of the view
        var currentRotationAngle: CGFloat = 0
        //var stopTime: Double =
        if let presentationLayer = layer.presentation(), let zValue = presentationLayer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            currentRotationAngle = zValue
        }
        
        // remove the animation
        // this has the side effect of rotating it back to the starting angle
        layer.removeAnimation(forKey: rotationAnimationKey)
        
        // rotate the view back to the correct rotation angle
        let randomDouble = Double.random(in: 3.0..<6.0)
        layer.transform = CATransform3DMakeRotation(randomDouble, 0, 0, 1)
    }
    
    /**
        Resets the UIView back to its starting rotation angle.
    */
    func resetRotation() {
        if isRotating {
            // remove the animation, which also rotates it back to the starting angle
            layer.removeAnimation(forKey: rotationAnimationKey)
        } else {
            layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
        }
    }
    
    /**
        Whether or not the UIView is currently rotating. (read only)
    */
    var isRotating: Bool {
        guard let animationKeys = layer.animationKeys() else { return false }
        return animationKeys.contains(rotationAnimationKey)
    }
    
    func zoomOut() {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
            }) { (finished) in
                UIView.animate(withDuration: 1, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
}
