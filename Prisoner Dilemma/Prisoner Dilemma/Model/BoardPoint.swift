//
//  BoardPoint.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 22/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import Foundation
import GameplayKit


class BoardPoint{
    
    func display() -> [Int]{
        
        var value: [Int] = []
        
        let randomSource = GKARC4RandomSource()
        
        var randomDist = GKShuffledDistribution(randomSource: randomSource, lowestValue: 0, highestValue: 30)
        
       
        
        
        for _ in 0 ... 3{
            
            var randomValue = randomDist.nextInt()
            
            value.append(randomValue)
        }

        
        return value
        
    }
}
