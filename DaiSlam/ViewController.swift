//
//  ViewController.swift
//  DaiSlam
//
//  Created by DaidoujiChen on 2015/11/27.
//  Copyright © 2015年 DaidoujiChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var squareView: UIView = {
        let newSquareView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        newSquareView.backgroundColor = UIColor.redColor()
        newSquareView.center = self.view.center
        newSquareView.layer.shadowColor = UIColor.blackColor().CGColor
        newSquareView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        newSquareView.layer.shadowOpacity = 1.0
        newSquareView.layer.shadowRadius = 2.0
        newSquareView.layer.cornerRadius = 75.0
        return newSquareView
    }()
    var isHoldSquare = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.squareView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        self.isHoldSquare = touch.view == self.squareView
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        if self.isHoldSquare {
            self.squareView.layer.shadowRadius = 2.0 + (touch.force / touch.maximumPossibleForce) * 20.0
            let scale = 1.0 + (touch.force / touch.maximumPossibleForce) * 0.1
            self.squareView.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale)
            
            if touch.force > 2.5 {
                let currentLocation = touch.locationInView(self.view)
                let previousLocation = touch.previousLocationInView(self.view)
                let deltaX = currentLocation.x - previousLocation.x
                let deltaY = currentLocation.y - previousLocation.y
                let newCenter = CGPoint(x: self.squareView.center.x + deltaX, y: self.squareView.center.y + deltaY)
                self.squareView.center = newCenter
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.isHoldSquare {
            self.squareView.layer.shadowRadius = 2.0
            self.squareView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        }
        self.isHoldSquare = false
    }
    
}
