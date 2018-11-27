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
    @IBOutlet weak var winImage: UIImageView! //Not necesary
    @IBOutlet weak var scratchImage: SRScratchView! //Not necesary
    
    @IBOutlet weak var cardView: UIView! 
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    
    
    @IBAction func clickCardButton(_ sender: UIButton) {
        if sender.tag==1 {
            print("1 pressed")
            
//            UIView.animate(withDuration:0.6, animations: { self.cardView.transform = CGAffineTransform(scaleX:3,y:3) })
//
//            flipCard(view1: backView, view2: frontView)
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
        scratchImage.lineWidth = 20
        
    }
    
    
    //MARK: FUNCTIONS //////////////////////////////////////////////////////
    //TODO: SRScratchViewDelegate function for know when the scracth is less that something
    func scratchCardEraseProgress(eraseProgress: Float) {
        
        print(eraseProgress)
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImage.alpha = 0.0
                self.cardView.boing()
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
        
        //Set delegate to the sratchController
        self.scratchImage.delegate = self
        //Make scratch surface a circle
        self.scratchImage.layer.cornerRadius = self.scratchImage.frame.height/2
        self.scratchImage.layer.masksToBounds = true
        self.winImage.layer.cornerRadius = self.scratchImage.frame.height/2
        self.winImage.layer.masksToBounds = true
        self.frontView.cornerRadius = 10
        self.frontView.layer.masksToBounds = true
    }
    
}

