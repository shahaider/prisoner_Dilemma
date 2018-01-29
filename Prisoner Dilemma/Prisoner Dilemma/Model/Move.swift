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
        case cooperate = 0
        case defect
       
        
    }
    
    
    
    var value : Int = 0
    var decision : Int
    
    init(Decision: Int){
        self.decision = Decision
    }
     
    
    
    static func playerMove() -> Int{
        
        let move = GKRandomSource()
        let moveDist = GKRandomDistribution(randomSource: move, lowestValue: 0, highestValue: 1)
        
        return Int(moveDist.nextInt())
    }
    
    
    
}
