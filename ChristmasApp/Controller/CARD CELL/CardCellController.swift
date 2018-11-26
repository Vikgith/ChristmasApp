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

class CardCellController: CardCell {
    

    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBAction func touchCellButton(_ sender: UIButton) {
        
        self.flipCard1(view1: backView, view2: frontView)
        self.pulsate()
        
        sender.isEnabled = false
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
        
        self.layer.cornerRadius = 30
        
        super.layoutSubviews()
    }

}
