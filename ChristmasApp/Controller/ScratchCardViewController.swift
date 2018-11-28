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
 
    //MARK: VARIABLES AND LET
    private var isFlipped: Bool = false
    
    //MARK: OUTLETS ///////////////////////////////////////////////////////
    //VIEW 1
    @IBOutlet weak var winImage1: UIImageView!
    @IBOutlet weak var scratchImage1: SRScratchView!
    @IBOutlet weak var cardView1: UIView! 
    @IBOutlet weak var frontView1: UIView!
    @IBOutlet weak var backView1: UIView!
    //VIEW 2
    
    //VIEW 3
    
    //VIEW 4
    
    
    @IBAction func clickCardButton(_ sender: UIButton) {
        if sender.tag==1 {
            print("1 pressed")
            
            UIView.animate(withDuration:0.6, animations: { self.cardView1.transform = CGAffineTransform(scaleX:3,y:3) })

            flipCard(view1: backView1, view2: frontView1)
        } else if sender.tag==2 {
            print("2 pressed")
        } else if sender.tag==3 {
            print("3 pressed")
        } else if sender.tag==4 {
            print("4 pressed")
        }
        
        
    }
    
    //MARK: VIEW DID LOAD //////////////////////////////////////////////////
    override func viewDidLoad() { super.viewDidLoad()
        
        setLayers()
        self.scratchImage1.delegate = self
        scratchImage1.lineWidth = 20
        
    }
    
    
    //MARK: FUNCTIONS //////////////////////////////////////////////////////
    //TODO: SRScratchViewDelegate function for know when the scracth is less that something
    func scratchCardEraseProgress(eraseProgress: Float) {
        
        print(eraseProgress)
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImage1.alpha = 0.0
                self.cardView1.boing()
                self.createParticles()
            })
        }
    }
    
    //TODO: Function for flipping cards
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
    
    //TODO: Function to set the layers at the begining
    func setLayers(){
        //width of srcatch line
        
        
        self.scratchImage1.layer.cornerRadius = self.scratchImage1.frame.height/2
        self.scratchImage1.layer.masksToBounds = true
        self.winImage1.layer.cornerRadius = self.scratchImage1.frame.height/2
        self.winImage1.layer.masksToBounds = true
        self.frontView1.cornerRadius = 10
        self.frontView1.layer.masksToBounds = true
    }
    
}

