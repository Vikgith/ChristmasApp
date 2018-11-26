//
//  CardViewController.swift
//  ChristmasApp
//
//  Created by Victor Alonso on 2018-11-25.
//  Copyright © 2018 Victor Alonso. All rights reserved.
//

import UIKit
import VerticalCardSwiper
import SRScratchView

class MainViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource {
    
    
    
    @IBOutlet weak var cardSwiper: VerticalCardSwiper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper.delegate = self
        cardSwiper.datasource = self

        cardSwiper.register(nib: UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    }
    
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 3 //Display 5 cards
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: index) as! CardCellController
        
        //cardCell.setRandomBackgroundColor()
        
        return cardCell
    }
    
}
