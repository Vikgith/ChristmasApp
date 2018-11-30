//
//  Extensions.swift
//  ChristmasApp
//
//  Created by Victor Alonso on 2018-11-22.
//  Copyright © 2018 Victor Alonso. All rights reserved.
//

import Foundation
import UIKit

// MARK: Animation views (Buttons)
//5 Types of animate a View: Animate, Pulsate, Flash, Shake, Zoom In
extension UIView {
    
    /** Boing the UIView */
    func boing() {
        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)//How much it expands (0 much, 0.9 little)
        UIView.animate(withDuration:2, //Duration (Normal is 2)
            delay: 0, //Time to take to start the animation
            usingSpringWithDamping: CGFloat(0.5), //How much vibration (0.1:much, 1:little)
            initialSpringVelocity: CGFloat(2.6),//Makes it bigger in the beggining (normal:6,big:100)
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: { self.transform = CGAffineTransform.identity },
            completion: { Void in()  } )
    }
    
    /**Simply zooming in of a view:set view scale to Identity and zoom out to 0 on 'duration' time interval.
     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /** Animate like a pulse the UIView */
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 1
        pulse.toValue = 0.9
        pulse.autoreverses = false
        pulse.repeatCount = 0
        pulse.initialVelocity = 10
        pulse.damping = 0.05
        layer.add(pulse, forKey: "pulse")
    }
    
    func pulsate2() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 3.5
        pulse.toValue = 4
        pulse.autoreverses = false
        pulse.repeatCount = 0
        pulse.initialVelocity = 10
        pulse.damping = 0.05
        layer.add(pulse, forKey: "pulse")
    }
    
    /** Make a flash in the view */
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 0.1
        flash.toValue = 1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = false
        flash.repeatCount = 0
        layer.add(flash, forKey: nil)
    }
    
    /** Shake the UIView, usually for show an error */
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05 //vibrating:0.005
        shake.repeatCount = 3 //Vibrating: 50
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
// MARK: modify views
////////////////////////////////////////////////////////////////////
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {if let color = layer.borderColor {return UIColor(cgColor: color)}
            return nil
        }
        set {if let color = newValue{layer.borderColor = color.cgColor}
        else { layer.borderColor = nil }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {if let color = layer.shadowColor{return UIColor(cgColor: color)}
            return nil
        }
        set {if let color = newValue{layer.shadowColor = color.cgColor}
        else { layer.shadowColor = nil }
        }
    }
}

// MARK: Create particles Extension
////////////////////////////////////////////////////////////////////
extension UIViewController {
    /**Create particles thar falls from the top. by default the particles are white
     - parameter color: color of the particles
     */
    func createParticles(color: UIColor = UIColor.white, color2: UIColor = UIColor.white, color3: UIColor = UIColor.white) {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let cgcolor1 = makeEmitterCell(color: color)
        let cgcolor2 = makeEmitterCell(color: color2)
        let cgcolor3 = makeEmitterCell(color: color3)
        
        particleEmitter.emitterCells = [cgcolor1, cgcolor2, cgcolor3]
        
        view.layer.addSublayer(particleEmitter)
    }
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 2
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        
        cell.contents = UIImage(named: "Snow")?.cgImage
        return cell
    }
}

extension UIView {
    /**Flip the card, only one time, NO reverse.
     - parameter view1: the view to flip.
     - parameter view2: the final view.
     */
    func flipCard1 (view1:UIView?,view2:UIView?){
        
        UIView.transition(from: view1!,
                          to: view2!,
                          duration: 0.8, //0.5
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
}

extension UIView {
    
    func boing2(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 1
        pulse.toValue = 0.9
        pulse.autoreverses = false
        pulse.repeatCount = 0
        pulse.initialVelocity = 10
        pulse.damping = 0.05
        layer.add(pulse, forKey: "pulse")
    }
    
}
