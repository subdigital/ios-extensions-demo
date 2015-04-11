//
//  ShareViewController.swift
//  PinExtension
//
//  Created by Ben Scheirman on 10/1/14.
//  Copyright (c) 2014 Fickle Bits. All rights reserved.
//

import UIKit
import Social

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.extensionContext.
   
        self.transitionCoordinator()?.animateAlongsideTransition( {
            context in
            self.view.backgroundColor = UIColor.redColor()
        }, completion: nil)
    }
    
}
