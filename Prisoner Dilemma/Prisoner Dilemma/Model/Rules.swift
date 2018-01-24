//
//  Rules.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 24/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import Foundation
import GameplayKit

class Rules{
    
    let ruleSystem = GKRuleSystem()
    
    func scoreSet(){
        let playerCooperate = NSPredicate(format: "$playerOne point == Cooperate")
        let playerDefect = NSPredicate(format:"$playerOne point == Defect" )
        
        ruleSystem.add(GKRule(predicate: playerCooperate, assertingFact: "displayScore" as NSObjectProtocol, grade: 1.0))
        ruleSystem.add(GKRule(predicate: playerDefect, assertingFact: "displayScore" as NSObjectProtocol, grade: 1.0))

        
        
    }
    
    
    
    
    
}
