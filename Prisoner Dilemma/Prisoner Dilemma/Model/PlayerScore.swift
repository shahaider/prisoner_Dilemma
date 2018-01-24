//
//  PlayerScore.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 24/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import Foundation


class PlayerScore: NSObject{
    
    
    enum Score : Int{
        case empty
        case cooperate_cooperate
        case cooperate_defect
        case defect_defect
        case defect_cooperate
        
    }
    
//    var scoreValue: Score

    
    static var allScore = [Score(.cooperate_cooperate), Score(.cooperate_defect),Score(.defect_defect),Score(.defect_cooperate)]
    
}
