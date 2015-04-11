//
//  CoffeeTracker.swift
//  CoffeeTracker
//
//  Created by Ben Scheirman on 9/29/14.
//  Copyright (c) 2014 Fickle Bits. All rights reserved.
//

import UIKit

@objc class CoffeeTracker : NSObject  {
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    var userDefaults: NSUserDefaults {
        get {
            return NSUserDefaults(suiteName: "group.com.nsscreencast.coffeetracker")!
        }
    }
    
    var numberOfCups: Int {
        get {
            return userDefaults.integerForKey("cups")
        }
        set {
            userDefaults.setInteger(newValue, forKey: "cups")
            updateDisplay()
        }
    }
    
    func updateDisplay() {
        userDefaults.synchronize()
        stepper.value = Double(numberOfCups)
        numberLabel.text = String(numberOfCups)
    }
    
    @IBAction func stepperChanged(stepper: UIStepper) {
        numberOfCups = Int(stepper.value)
    }

}
