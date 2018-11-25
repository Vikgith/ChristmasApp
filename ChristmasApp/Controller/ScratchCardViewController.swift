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
    
    
    @IBOutlet weak var scratchCardView: UIView!
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    
    
    @IBOutlet weak var cardView: UIView! //FrontView (View:scratch,images,..)
    @IBOutlet weak var backCardView: UIView! //CardView (View: front&back
    
    @IBOutlet weak var backView: UIView! //BackView
    
    
    @IBAction func snowButton(_ sender: UIButton) {
        
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? backView : cardView //cardView : backImageView
        let bottomCard = isFlipped ? cardView : backView //backImageView : cardView
        
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
    
        self.cardView.cornerRadius = 10
        self.cardView.layer.masksToBounds = true
        
        
    }
    
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.backCardView.boing()
                self.createParticles(color: UIColor.white, color2: UIColor.white, color3: UIColor.white)
            })
        }
    }
    
}

