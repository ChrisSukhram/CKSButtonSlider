//
//  ViewController.swift
//  CKSButtonSlider
//
//  Created by Chris Sukhram on 1/26/16.
//  Copyright © 2016 CKSMedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redBtn: CKSButtonSlider!
    @IBOutlet var blueBtn: CKSButtonSlider!
    @IBOutlet var greenBtn: CKSButtonSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        redBtn.addTarget(self, action: "sliderButtonValueChanged:", forControlEvents: .ValueChanged)
        
        blueBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        blueBtn.addTarget(self, action: "sliderButtonValueChanged:", forControlEvents: .ValueChanged)
        
        greenBtn.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
        greenBtn.addTarget(self, action: "sliderButtonValueChanged:", forControlEvents: .ValueChanged)
    }

    func buttonPressed(button:CKSButtonSlider) {
        button.setTitle("Set Value: \(button.currentTick)", forState: .Normal)
    }
    
    func sliderButtonValueChanged(sliderButton:CKSButtonSlider) {
        sliderButton.setTitle("Sliding at: \(sliderButton.currentTick)", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

