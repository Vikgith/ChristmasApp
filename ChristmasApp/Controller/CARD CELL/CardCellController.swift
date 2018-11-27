//
//  ExampleCardCell.swift
//  ChristmasApp
//
//  Created by Victor Alonso on 2018-11-25.
//  Copyright © 2018 Victor Alonso. All rights reserved.
//

import Foundation
import UIKit
import VerticalCardSwiper
import SRScratchView

class CardCellController: CardCell, SRScratchViewDelegate{
    
    @IBOutlet weak var scratchView: SRScratchView!
    @IBOutlet weak var winView: UIImageView!
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBAction func touchCellButton(_ sender: UIButton) {
        
        self.flipCard1(view1: backView, view2: frontView)
        self.boing2()
        
        sender.isEnabled = false
    }
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)

//        self.scratchView.delegate = self
        
        if eraseProgress > 50.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchView.alpha = 0.0
            })
        }
    }
    
    /**
     This function calculate and set a random backgroundcolor.
     */
    public func setRandomBackgroundColor(){
        
        let randomRed:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        self.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)

    }
    
    override func layoutSubviews() {
        
        let cardRadius : CGFloat = 60
        let scratchRadius : CGFloat = 150
        
        frontView.cornerRadius = cardRadius
        frontView.layer.masksToBounds = true
        
        backView.cornerRadius = cardRadius
        backView.layer.masksToBounds = true
        
        scratchView.cornerRadius = scratchRadius
        scratchView.layer.masksToBounds = true
        
        winView.cornerRadius = scratchRadius
        winView.layer.masksToBounds = true
        
        super.layoutSubviews()
    }
    
//    func setCollectionViewDataSourceDelegate <D: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: D) {
//
//        scratchView.delegate = self
////        dayTicks.delegate = dataSourceDelegate
////        dayTicks.dataSource = dataSourceDelegate
////        dayTicks.reloadData()
//
//    }
    
}
