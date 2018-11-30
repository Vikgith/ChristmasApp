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
    var animator1: UIViewPropertyAnimator!
    var animator2: UIViewPropertyAnimator!
    var animator3: UIViewPropertyAnimator!
    var animator4: UIViewPropertyAnimator!

    
    //MARK: OUTLETS ///////////////////////////////////////////////////////
    
    @IBOutlet weak var generalView: UIView!
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
        
        
        sender.isEnabled=false
        isFlipped = false
 //            UIView.animate(withDuration:0.6, animations: { self.cardView2.transform = CGAffineTransform(scaleX:3,y:3) })
        if sender.tag==1 {
            num = 1
            animator1.startAnimation()
            UIView.animate(withDuration:1, animations: {
                self.cardView4.alpha=0
                self.cardView2.alpha=0
                self.cardView3.alpha=0
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.flipCard(view1: self.backView1, view2: self.frontView1)
            }
            
            
        } else if sender.tag==2 {
            num=2
            animator2.startAnimation()
            UIView.animate(withDuration:1, animations: {
                self.cardView1.alpha=0
                self.cardView3.alpha=0
                self.cardView4.alpha=0
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.flipCard(view1: self.backView2, view2: self.frontView2)
            }
            
            
        } else if sender.tag==3 {
            num=3
            animator3.startAnimation()
            UIView.animate(withDuration:1, animations: {
                self.cardView1.alpha=0
                self.cardView2.alpha=0
                self.cardView4.alpha=0
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.flipCard(view1: self.backView3, view2: self.frontView3)
            }
            
        } else if sender.tag==4 {
            num=4
            animator4.startAnimation()
            UIView.animate(withDuration:1, animations: {
                self.cardView1.alpha=0
                self.cardView3.alpha=0
                self.cardView2.alpha=0
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.flipCard(view1: self.backView4, view2: self.frontView4)
            }
        }
        
        
    }
    
    //MARK: VIEW DID LOAD //////////////////////////////////////////////////
    override func viewDidLoad() { super.viewDidLoad()
        
        setLayers()
        setAnimations()
        setDelegatesAndLineWidth()
        setBeatView()
        
    }
    
    
    //MARK: FUNCTIONS //////////////////////////////////////////////////////
    //TODO: SRScratchViewDelegate function for know when the scracth is less that something
    func scratchCardEraseProgress(eraseProgress: Float) {
        
        print(eraseProgress)
        
        if eraseProgress > 40{
            
            UIView.animate(withDuration: 0.5, animations: {
                self.createParticles()
                
                if self.num == 1{
                    self.scratchImage1.alpha = 0.0
                    //self.cardView1.boing()
                    
                }else if self.num == 2{
                    self.scratchImage2.alpha = 0.0
                    //self.cardView2.boing()
                    
                }else if self.num == 3{
                    self.scratchImage3.alpha = 0.0
                    //self.cardView3.boing()
                    
                }else if self.num == 4{
                    self.scratchImage4.alpha = 0.0
                    //self.cardView4.boing()
                    
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
                          duration: 1,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews,
                                    .preferredFramesPerSecond60, .curveEaseInOut ],
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
    
    func setAnimations(){
        
        animator1 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {/* [unowned self, box] in*/
            self.cardView1.center.x = self.generalView.center.x
            self.cardView1.center.y = self.generalView.center.y
            
            self.cardView1.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 3.5, y: 3.5)
            self.cardView1.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2).scaledBy(x: 3.5, y: 3.5)
            /////////
            self.cardView2.center.y = self.view.frame.height
            self.cardView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView3.center.y = self.view.frame.height
            self.cardView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView4.center.y = self.view.frame.height
            self.cardView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        
        animator2 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
            self.cardView2.center.x = self.generalView.center.x
            self.cardView2.center.y = self.generalView.center.y
            
            self.cardView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 3.5, y: 3.5)
            self.cardView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2).scaledBy(x: 3.5, y: 3.5)
            /////////
            self.cardView1.center.y = self.view.frame.height
            self.cardView1.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView3.center.y = self.view.frame.height
            self.cardView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView4.center.y = self.view.frame.height
            self.cardView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        
        animator3 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
            self.cardView3.center.x = self.generalView.center.x
            self.cardView3.center.y = self.generalView.center.y
            
            self.cardView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 3.5, y: 3.5)
            self.cardView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2).scaledBy(x: 3.5, y: 3.5)
            /////////
            self.cardView2.center.y = self.view.frame.height
            self.cardView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView1.center.y = self.view.frame.height
            self.cardView1.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView4.center.y = self.view.frame.height
            self.cardView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        
        animator4 = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut) {
            self.cardView4.center.x = self.generalView.center.x
            self.cardView4.center.y = self.generalView.center.y
            
            self.cardView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 3.5, y: 3.5)
            self.cardView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2).scaledBy(x: 3.5, y: 3.5)
            /////////
            self.cardView2.center.y = self.view.frame.height
            self.cardView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView3.center.y = self.view.frame.height
            self.cardView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            self.cardView1.center.y = self.view.frame.height
            self.cardView1.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
    }
    
    func setDelegatesAndLineWidth (){
        self.scratchImage1.delegate = self
        self.scratchImage2.delegate = self
        self.scratchImage3.delegate = self
        self.scratchImage4.delegate = self
        
        scratchImage1.lineWidth = 10
        scratchImage2.lineWidth = 10
        scratchImage3.lineWidth = 10
        scratchImage4.lineWidth = 10
    }
    
    func setBeatView(){
        generalView.isUserInteractionEnabled=false
        
        cardView1.beat()
        cardView2.beat()
        cardView3.beat()
        cardView4.beat()
        
        //Run the code inside after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.generalView.isUserInteractionEnabled=true
        }
    }
    
    
}

