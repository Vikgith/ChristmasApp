//
//  ViewController.swift
//  ChristmasApp
//
//  Created by Victor Alonso on 2018-11-22.
//  Copyright © 2018 Victor Alonso. All rights reserved.
//

import UIKit
import SRScratchView

@IBDesignable

class ViewController: UIViewController,SRScratchViewDelegate{
    
    @IBOutlet weak var scratchCardView: UIView!
    
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //width of srcatch line
        scratchImageView.lineWidth = 30
        
        self.scratchImageView.delegate = self
        
        /***For making the views a circle form***/
        
        //        self.scratchImageView.layer.cornerRadius = self.scratchImageView.frame.height/2
        //        self.scratchImageView.layer.masksToBounds = true
        //        self.scratchCardView.layer.cornerRadius = self.scratchCardView.frame.height/2
        //        self.scratchCardView.layer.masksToBounds = true
        
        self.scratchImageView.layer.cornerRadius = 50
        self.scratchImageView.layer.masksToBounds = true
        
        self.scratchCardView.layer.cornerRadius = 50
        self.scratchCardView.layer.masksToBounds = true
        
    }
    
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        
        if eraseProgress > 60.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.scratchCardView.boing()
                self.scratchImageView.boing()
                
            })
        }
    }
    
}

