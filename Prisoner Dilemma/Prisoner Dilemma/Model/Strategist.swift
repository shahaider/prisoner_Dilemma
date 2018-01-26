

import GameplayKit



class Strategist {

    let strategist = GKMinmaxStrategist()

    func createStrategist(){
        strategist.maxLookAheadDepth = 0
        strategist.randomSource = GKARC4RandomSource()
        strategist.gameModel = Board()
    }

    func bestMoveForPlayer(player: Player) -> Int{

        let movevalue = 1
        if let AIMove = strategist.bestMove(for: player) {
            let defaultMove = AIMove.value
//            movevalue = arc4random() % 2 == 0 ? 0: 1
            return defaultMove

                    }
        return movevalue


    }

    func MoveForPlayer() -> Int
    {
        var move : Int = 0
        move = arc4random() % 2 == 0 ? 0 : 1

        return move

    }
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

