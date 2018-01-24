//
//  Move.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 22/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import GameplayKit


class Move: NSObject{
    
    
    // ***************** enum for Scoring Conditions *****************
    enum Score : Int{
        case cooperate_cooperate
        case cooperate_defect
        case defect_defect
        case defect_cooperate
        
    }
    
    
    
    var value : Int = 0
    var decision : String
    
    init(Decision: String){
        self.decision = Decision
    }
    
    
    
}
