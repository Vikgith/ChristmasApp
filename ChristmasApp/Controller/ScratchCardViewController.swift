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
    
    //variables & Let
    private var isFlipped: Bool = false
    
    //Interface Builders
    @IBOutlet weak var winImage: UIImageView!
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBAction func snowButton(_ sender: UIButton) {
        
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? backView : frontView
        let bottomCard = isFlipped ? frontView : backView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 1,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
        
    }
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //width of srcatch line
        scratchImageView.lineWidth = 30
        //Set delegate to the sratchController
        self.scratchImageView.delegate = self
        //Set the corner radius of the views
        setCorners()
        
    }
    
    //Function of SRScratchViewDelegate for set the "eraseProgress"
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        
        if eraseProgress > 40.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.cardView.boing()
                self.createParticles(color: UIColor.white, color2: UIColor.white, color3: UIColor.white)
            })
        }
    }
    
    func setCorners(){
        
        //Make scratch surface a circle
        self.scratchImageView.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.scratchImageView.layer.masksToBounds = true
        self.winImage.layer.cornerRadius = self.scratchImageView.frame.height/2
        self.winImage.layer.masksToBounds = true
        
        self.frontView.cornerRadius = 50
        self.frontView.layer.masksToBounds = true
        
    }
    
}

