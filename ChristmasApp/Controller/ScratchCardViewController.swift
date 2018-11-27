//
//  ViewController.swift
//  ChristmasApp
//
//  Created by Victor Alonso on 2018-11-22.
//  Copyright © 2018 Victor Alonso. All rights reserved.
//

import UIKit
import SRScratchView

class ViewController: UIViewController,SRScratchViewDelegate{
 
    
    private var isFlipped: Bool = false
    
    
    @IBOutlet weak var scratchCardView: UIView!
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    @IBAction func snowButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.6, animations: { self.cardView.transform = CGAffineTransform(scaleX: 3, y: 3) })
        
        flipCard(view1: backView, view2: frontView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //width of srcatch line
        scratchImageView.lineWidth = 20
        //Set delegate to the sratchController
        self.scratchImageView.delegate = self
        //Make scratch surface a circle
        self.scratchImageView.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.scratchImageView.layer.masksToBounds = true
        self.scratchCardView.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.scratchCardView.layer.masksToBounds = true
    
        self.frontView.cornerRadius = 10
        self.frontView.layer.masksToBounds = true
        
        
    }
    
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.cardView.boing()
                self.createParticles()
            })
        }
    }
    
    func flipCard (view1:UIView?,view2:UIView?){
        
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? view1 : view2
        let bottomCard = isFlipped ? view2 : view1
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }
    
}

