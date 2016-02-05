//
//  CKSButtonSlider.swift
//  CKSButtonSlider
//
//  Created by Chris Sukhram on 1/26/16.
//  Copyright © 2016 CKSMedia. All rights reserved.
//

import UIKit

@IBDesignable
public class CKSButtonSlider: UIButton {
    
    @IBInspectable var fillViewColor:UIColor = UIColor.whiteColor() {
        didSet {
            fillView.backgroundColor = fillViewColor
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.clearColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    public var percentValue:CGFloat {
        let percent = CGFloat(currentTick)/CGFloat(numberOfTicks)
        return min(max(percent, 0), 1)
    }
    
    @IBInspectable var currentTick:Int = 0 {
        didSet {
            if currentTick > numberOfTicks {
                currentTick = numberOfTicks
            }
            else if currentTick < 0 {
                currentTick = 0
            }
            updateFillView()
        }
    }
    
    private var tickSize:CGFloat {
        return self.bounds.width/CGFloat(numberOfTicks)
    }
    
    @IBInspectable var numberOfTicks:Int = 50
    
    private let fillView = UIView()
    
    private var dragThreshold:CGFloat = 10
    private var initalTouch:CGPoint = CGPointMake(0, 0)
    private var isDragging = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.setupFillView()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        
        self.layer.addSublayer(fillView.layer)
    }
    
    private func setupFillView() {
        fillView.backgroundColor = fillViewColor
        fillView.userInteractionEnabled = false
    }
    
    
    public override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        isDragging = false
        initalTouch = touch.locationInView(self)
        return super.beginTrackingWithTouch(touch, withEvent: event)
    }
    
    public override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let touchLoc = touch.locationInView(self)
        
        if abs(touchLoc.x - initalTouch.x)  > dragThreshold{
            isDragging = true
        }
        
        if isDragging{
            updateFillView(touchLoc)
            sendActionsForControlEvents(.ValueChanged)
        }
        
        return super.continueTrackingWithTouch(touch, withEvent: event)
    }
    
    public override func cancelTrackingWithEvent(event: UIEvent?) {
        super.cancelTrackingWithEvent(event)
        isDragging = false
    }
    
    public override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        super.endTrackingWithTouch(touch, withEvent: event)
        isDragging = false
    }
    
    private func updateFillView(touchLoc:CGPoint) {
        currentTick = min(max(Int((touchLoc.x/self.frame.width) * CGFloat(numberOfTicks)), 0), numberOfTicks)
        fillView.frame = CGRectMake(0, 0, touchLoc.x, self.bounds.height)
    }
    
    private func updateFillView() {
        fillView.frame = CGRectMake(0, 0, CGFloat(currentTick) * tickSize, self.bounds.height)
    }
}
