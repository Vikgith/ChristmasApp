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
 
    
    private var isFlipped: Bool = false
    
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var scratchCardView: UIView!
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backCardView: UIView!
    
    
    
    @IBAction func snowButton(_ sender: UIButton) {
        //createParticles(color: UIColor.white, color2: UIColor.white, color3: UIColor.white)
        
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? cardView : backCardView
        let bottomCard = isFlipped ? backCardView : cardView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //width of srcatch line
        scratchImageView.lineWidth = 30
        //Set delegate to the sratchController
        self.scratchImageView.delegate = self
        //Make scratch surface a circle
        self.scratchImageView.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.scratchImageView.layer.masksToBounds = true
        self.scratchCardView.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.scratchCardView.layer.masksToBounds = true
        
    }
    
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.cardView.boing()
            })
        }
    }
    
}
