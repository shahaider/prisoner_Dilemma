//
//  Board.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 24/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import GameplayKit


class Board : NSObject{
    

    
    // VARIABLE TO BE USE IN THIS CLASS
//    var currentPlayer = Player.allPlayers[arc4random() % 2 == 0 ? 0 : 1]
        var currentPlayer = Player.allPlayers[0]
   
    var displayScore = [0,0,0,0]

    var iterationNumber = 0
    var humanSum = 0
    var machineSum = 0
    
//    var playerScore = PlayerScore
    
    // INITIALIZE IN GKRULESYSTEM CLASS
    let ruleSystem = GKRuleSystem()
    
//    fileprivate var values: [PlayerScore.Score] = [.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty,.empty]
    fileprivate var values: [Player.Value] = []

    
    subscript(decision: Int) -> Player.Value {
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
        
        print(currentPlayer)

        displayScore.removeAll()
        
        var value: [Int] = []
        let randomSource = GKARC4RandomSource()
        let randomDist = GKShuffledDistribution(randomSource: randomSource, lowestValue: 0, highestValue: 30)
        
        for _ in 0 ... 3{
            
            let randomValue = randomDist.nextInt()
            value.append(randomValue)
        }
        
        displayScore = value

        
        return value
        
    }
    
    
    
    // *************************** IF ALL ITERATION HAVE BEEN COMPLETED **********************
    func isComplete(iteration: Int)-> Bool {
        
        if iteration < 10 {
            return false
        }
        
        return true
    }
    
    
    
    // ******************** Game SCORING CONDITION **********************************
    
    
    var playerScoring: Int {

        /*
         GKRULESYSTEM IMPLEMENTATION

         */
        let playerCooperate = NSPredicate(format: "$Decision.intValue == 0 ")
        let playerDefect = NSPredicate(format:"$Decision.intValue == 1" )
    
        
      
        ruleSystem.add(GKRule(predicate: playerCooperate, assertingFact: "decision" as NSObjectProtocol, grade: 1))
        ruleSystem.add(GKRule(predicate: playerDefect, retractingFact: "decision" as NSObjectProtocol, grade: 1))

        
        return 0
    }
    
    
    
    
    func checkPlayerDecision(playerOneDecision: Int, playTwoDecision: Int, Score: [Int] )-> (Int, Int) {
        
        let cooperate_defect = Score[0]
        let defect_defect = Score[1]
        let cooperate_cooperate = Score[2]
        let defect_cooperarte = Score[3]
        
        
//        print("*********************")
//        print("player1 : \(playerOneDecision) & player2 : \(playTwoDecision)")
//        print("*********************")
        
        
        
        var _ : (Int,Int)
        
        
        
        if playerOneDecision == 0 && playTwoDecision == 0{
            // Cooperation
//            combineDecision = (cooperate_cooperate,cooperate_cooperate)
            
            sumUp(humanScore: cooperate_cooperate, machineScore: cooperate_cooperate)
            
            return(cooperate_cooperate,cooperate_cooperate)
        }
        
            
            
        else if playerOneDecision == 1 && playTwoDecision == 0 {
            // Defect - Cooperate
            
                sumUp(humanScore: defect_cooperarte, machineScore: cooperate_defect)
            
            return (defect_cooperarte,cooperate_defect)
            

        }
        
        else if playerOneDecision == 0 && playTwoDecision == 1 {
            // Cooperate - Defect

            sumUp(humanScore: cooperate_defect, machineScore: defect_cooperarte)
            
            return(cooperate_defect,defect_cooperarte)

        }
        
        else if playerOneDecision == 1 && playTwoDecision == 1 {
            // Defect - Defect

            sumUp(humanScore: defect_defect, machineScore: defect_defect)
            
           return(defect_defect,defect_defect)

        }
        self.iterationNumber += 1
        return (0,0)
        
        
//        ruleSystem.state["Decision"] = 22
//
//        ruleSystem.reset()
//        ruleSystem.evaluate()
//
//
//        print(ruleSystem.grade(forFact: "decision" as! NSObjectProtocol))
//
//        let decisionValue = (ruleSystem.grade(forFact: "decision" as NSObjectProtocol) == 0)
//        print(decisionValue)
////        playerScoring(checkPlayerDecision(playerDecision: decisionValue.)
    }
    
    
    func sumUp(humanScore : Int , machineScore : Int){
        
        self.humanSum += humanScore
        self.machineSum += machineScore
        
        print("human: \(self.humanSum) & machine: \(self.machineSum)")
        
    }
    
    
    // ****************************************
    
    func canMove(taken Decision: Int) -> Bool {
        if self[Decision] == .empty {
            return true
        } else {
            return false
        }
    }
    
    var winningPlayer: Player? {
        
        return nil
    }
   
    
}



// ******************A.I PART


extension Board: GKGameModel{
    var players: [GKGameModelPlayer]? {
  
        return Player.allPlayers

    }
    
    
    
    var activePlayer: GKGameModelPlayer? {
        
        return currentPlayer.opponent

    }
    
    
    
    
    func setGameModel(_ gameModel: GKGameModel) {
        if let board = gameModel as? Board{
        values = board.values
                    }
    }
    
    
    
    
    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        guard player is Player else {
            return nil
        }
        
        var moves : [GKGameModelUpdate] = []
        
        if isComplete(iteration: iterationNumber ) == false{
             moves = [Move]()
        }
        return moves
    }
    
    
    
    
    
    func apply(_ gameModelUpdate: GKGameModelUpdate) {
        guard  let move = gameModelUpdate as? Move else {
                        return
                    }
        
                    // 3
                    self[Int(move.decision)] = currentPlayer.playerValue
                    currentPlayer = currentPlayer.opponent
    }
    
    
    
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copyme = Board()
        copyme.setGameModel(self)
        return copyme
    }
    
    
    
    
}
 

