//
//  Move.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 22/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import GameplayKit


class Move: NSObject, GKGameModelUpdate{
    
    
    // ***************** enum for Scoring Conditions *****************
    enum Decision : Int{
        case cooperate
        case defect
        case none
       
        
    }
    
    
    
    var value : Int = 0
    var decision : Int
    
    init(Decision: Int){
        self.decision = Decision
    }
    
    
    
}
