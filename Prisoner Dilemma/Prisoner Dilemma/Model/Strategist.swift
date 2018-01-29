

import GameplayKit



class Strategist {

    let strategist = GKMinmaxStrategist()
let board = Board()
    func createStrategist(){
        strategist.maxLookAheadDepth = 0
        strategist.randomSource = GKARC4RandomSource()
        strategist.gameModel = Board()
    }

    func bestMoveForPlayer(player: Player) -> Int{

        
        var AIMoves = Move.playerMove()
        
        if let opponent = strategist.bestMove(for: player) as? Move {
           
            AIMoves = opponent.decision
            
            return AIMoves

                    }
        
        return AIMoves

    }

    
    // TESTING Player Move with reforcement basis.
//    func MoveForPlayer() -> Int
//    {
//        var move : Int = 0
//        move = arc4random() % 2 == 0 ? 0 : 1
//
//        return move
//
//    }
//
////
////
}




//struct Strategist {
//
//    private let strategist: GKMinmaxStrategist = {
//        let strategist = GKMinmaxStrategist()
//
//        strategist.maxLookAheadDepth = 5
//        strategist.randomSource = GKARC4RandomSource()
//
//        return strategist
//    }()
//
//
//
//    var board: Board {
//        didSet {
//            strategist.gameModel = board
//        }
//    }
//
//
//    var bestDecision: Int {
//
//        let defaultMove = arc4random() % 2 == 0 ? 0 : 1
//
////        if let move = strategist.bestMove(for: board.currentPlayer.opponent) as? Move {
////
////            return move.decision
////        }
//
//        return defaultMove
//    }
//
//}

////

