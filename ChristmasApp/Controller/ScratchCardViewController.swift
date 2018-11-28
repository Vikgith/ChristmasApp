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
    var num = 0
    
    //MARK: OUTLETS ///////////////////////////////////////////////////////
    //VIEW 1
    @IBOutlet weak var cardView1: UIView!
    @IBOutlet weak var frontView1: UIView!
    @IBOutlet weak var backView1: UIView!
    
    @IBOutlet weak var winImage1: UIImageView!
    @IBOutlet weak var scratchImage1: SRScratchView!
    
    //VIEW 2
    @IBOutlet weak var cardView2: UIView!
    @IBOutlet weak var frontView2: UIView!
    @IBOutlet weak var backView2: UIView!
    
    @IBOutlet weak var winImage2: UIImageView!
    @IBOutlet weak var scratchImage2: SRScratchView!
    
    //VIEW 3
    @IBOutlet weak var cardView3: UIView!
    @IBOutlet weak var frontView3: UIView!
    @IBOutlet weak var backView3: UIView!
    
    @IBOutlet weak var winImage3: UIImageView!
    @IBOutlet weak var scratchImage3: SRScratchView!
    
    //VIEW 4
    @IBOutlet weak var cardView4: UIView!
    @IBOutlet weak var frontView4: UIView!
    @IBOutlet weak var backView4: UIView!
    
    @IBOutlet weak var winImage4: UIImageView!
    @IBOutlet weak var scratchImage4: SRScratchView!
    
    //BUTTON
    @IBAction func clickCardButton(_ sender: UIButton) {
        
        isFlipped = false
        
        if sender.tag==1 {
            num = 1
//            UIView.animate(withDuration:0.6, animations: { self.cardView2.transform = CGAffineTransform(scaleX:3,y:3) })

            flipCard(view1: backView1, view2: frontView1)
        } else if sender.tag==2 {
            num=2
            flipCard(view1: backView2, view2: frontView2)
        } else if sender.tag==3 {
            num=3
            flipCard(view1: backView3, view2: frontView3)
        } else if sender.tag==4 {
            num=4
            flipCard(view1: backView4, view2: frontView4)
        }
    }
    
    //MARK: VIEW DID LOAD //////////////////////////////////////////////////
    override func viewDidLoad() { super.viewDidLoad()
        
        setLayers()
        self.scratchImage1.delegate = self
        self.scratchImage2.delegate = self
        self.scratchImage3.delegate = self
        self.scratchImage4.delegate = self
        scratchImage2.lineWidth = 20
        
    }
    
    
    //MARK: FUNCTIONS //////////////////////////////////////////////////////
    //TODO: SRScratchViewDelegate function for know when the scracth is less that something
    func scratchCardEraseProgress(eraseProgress: Float) {
        
        print(eraseProgress)
        
        if eraseProgress > 50{
            UIView.animate(withDuration: 0.5, animations: {
                if self.num == 1{
                    self.scratchImage1.alpha = 0.0
                    self.cardView1.boing()
                    self.createParticles()
                }else if self.num == 2{
                    self.scratchImage2.alpha = 0.0
                    self.cardView2.boing()
                    self.createParticles()
                }else if self.num == 3{
                    self.scratchImage3.alpha = 0.0
                    self.cardView3.boing()
                    self.createParticles()
                }else if self.num == 4{
                    self.scratchImage4.alpha = 0.0
                    self.cardView4.boing()
                    self.createParticles()
                }
                
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
        
        self.scratchImage1.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.scratchImage1.layer.masksToBounds = true
        self.winImage1.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.winImage1.layer.masksToBounds = true
        self.frontView1.cornerRadius = 10
        self.frontView1.layer.masksToBounds = true
        
        self.scratchImage2.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.scratchImage2.layer.masksToBounds = true
        self.winImage2.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.winImage2.layer.masksToBounds = true
        self.frontView2.cornerRadius = 10
        self.frontView2.layer.masksToBounds = true

        
        self.scratchImage3.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.scratchImage3.layer.masksToBounds = true
        self.winImage3.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.winImage3.layer.masksToBounds = true
        self.frontView3.cornerRadius = 10
        self.frontView3.layer.masksToBounds = true

        
        self.scratchImage4.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.scratchImage4.layer.masksToBounds = true
        self.winImage4.layer.cornerRadius = self.scratchImage2.frame.height/2
        self.winImage4.layer.masksToBounds = true
        self.frontView4.cornerRadius = 10
        self.frontView4.layer.masksToBounds = true

    }
    
}

