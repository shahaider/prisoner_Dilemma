//
//  Board.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 24/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import Foundation
import GameplayKit


class Board{
    var displayScore = [0,0,0,0]
    
    // VARIABLE TO BE USE IN THIS CLASS
    var currentPlayer = Player.allPlayers[arc4random() % 2 == 0 ? 0 : 1]
    
    
    fileprivate var values: [PlayerScore.Score] = [.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty]
    
    
    subscript(decision: Int) -> PlayerScore.Score {
        get {
            return values[decision]
        }
        set {
            if values[decision] == .empty {
                values[decision] = newValue
            }
        }
    }
    
    
    
    // **************** SETTING BOARD POINT SET VALUES *************************
    func display() -> [Int]{
        
        
        displayScore.removeAll()
        
        var value: [Int] = []
        let randomSource = GKARC4RandomSource()
        let randomDist = GKShuffledDistribution(randomSource: randomSource, lowestValue: 0, highestValue: 5)
        
        for _ in 0 ... 3{
            
            let randomValue = randomDist.nextInt()
            value.append(randomValue)
        }
        
        displayScore = value
        //        print(displayScore)
        
        return value
        
    }
    
    
    
    // *************************** IF ALL ITERATION HAVE BEEN COMPLETED **********************
    var isComplete: Bool {
        
        if values.count != 10 {
            return false
        }
        
        return true
    }
    
    
    
    // ******************** Game SCORING CONDITION **********************************
    var playerScoring: Player? {

        /*
         GKRULESYSTEM IMPLEMENTATION

         */
        return nil
    }
    
    
    
    
    
    // ****************************************
    
    func canMove(taken Decision: Int) -> Bool {
        if self[Decision] == .empty {
            return true
        } else {
            return false
        }
    }
    
}



// ****************** A.I PART
//extension Board: GKGameModel{
//
//
//    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
//        // 1
//        guard let player = player as? Player else {
//            return nil
//        }
//
//        if isWin(for: player) {
//            return nil
//        }
//
//        var moves = [Move]()
//
//        // 2
//        for x in 0..<values.count {
//            for y in 0..<values[x].count {
//                let position = CGPoint(x: x, y: y)
//                if canMove(at: position) {
//                    moves.append(Move(position))
//                }
//            }
//        }
//
//        return moves
//
//    }
//
//
//
//
//    func apply(_ gameModelUpdate: GKGameModelUpdate) {
//        guard  let move = gameModelUpdate as? Move else {
//            return
//        }
//
//        // 3
//        self[Int(move.coordinate.x), Int(move.coordinate.y)] = currentPlayer.value
//        currentPlayer = currentPlayer.opponent
//    }
//
//
//    func copy(with zone: NSZone? = nil) -> Any {
//        let copyme = Board()
//        copyme.setGameModel(self)
//        return copyme
//    }
//
//    var players: [GKGameModelPlayer]?{
//
//        return Player.allPlayers
//    }
//
//    var activePlayer: GKGameModelPlayer?{
//        return currentPlayer
//    }
//
//    func setGameModel(_ gameModel: GKGameModel) {
//        if let board = gameModel as? Board{
//            values = board.values
//        }
//    }
//
//    func isWin(for player: GKGameModelPlayer) -> Bool {
//        guard let player = player as? Player else {
//            return false
//        }
//
//        if let winner = playerScoring {
//            return player == winner
//        } else {
//            return false
//        }
//    }
//
//
//
//
//    func score(for player: GKGameModelPlayer) -> Int {
//        guard let player = player as? Player else {
//            return Move.Score.none.rawValue
//        }
//
//        if isWin(for: player) {
//            return Move.Score.win.rawValue
//        } else {
//            return Move.Score.none.rawValue
//        }
//    }
//
//}

//}

