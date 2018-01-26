

import GameplayKit

struct Strategist {
//     1
    private let strategist: GKMinmaxStrategist = {
        let strategist = GKMinmaxStrategist()
        
        strategist.maxLookAheadDepth = 5
        strategist.randomSource = GKARC4RandomSource()
        
        return strategist
    }()
    
    // 2
    var board: Board {
        didSet {
            strategist.gameModel = board
        }
    }
    
    // 3
    var bestDecision: Int? {
        
        print(strategist.bestMoveForActivePlayer())
        
        if let move = strategist.bestMove(for: board.currentPlayer) as? Move {
            return move.decision
        }
        
        return nil
    }
    
}
