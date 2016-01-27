//
//  ViewController.swift
//  CKSButtonSlider
//
//  Created by Chris Sukhram on 1/26/16.
//  Copyright © 2016 CKSMedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CKSButtonSliderDelegate {

    @IBOutlet var redBtn: CKSButtonSlider!
    @IBOutlet var blueBtn: CKSButtonSlider!
    @IBOutlet var greenBtn: CKSButtonSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        redBtn.sliderButtonDelegate = self
    }

    func buttonPressed(button:CKSButtonSlider) {
        button.setTitle("\(button.currentTick)", forState: .Normal)
    }
    
    func didSlideTo(sliderButton: CKSButtonSlider, value: Int) {
        sliderButton.setTitle("Sliding To: \(sliderButton.currentTick)", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

