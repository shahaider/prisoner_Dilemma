//
//  PlayerScore.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 24/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import Foundation


class PlayerScore: NSObject{
    
    
    enum Score: Int {
        case empty 
        case cooperate_cooperate
        case cooperate_defect
        case defect_defect
        case defect_cooperate
        
        var Title: String {
            switch self {
            case .empty:
                return ""
                
            case .cooperate_cooperate:
                return "Both Cooperate"
                
            case .cooperate_defect:
                return "One Cooperate"
                
            case .defect_defect:
                return "Both Cooperate"
                
            case .defect_cooperate:
                return "One Defect"
            }
        }
    }
    
    var scoreValue: Score
    var title: String
    
    
    
//    static var allScoring = [
//        Score(rawValue: .cooperate_cooperate),
//                             Score(.cooperate_defect),
//                             Score(.defect_defect),
//                             Score(.defect_cooperate)
//    ]
    
        
    init(_ value: Score) {
        self.scoreValue = value
        title = value.Title
    }

    
}



