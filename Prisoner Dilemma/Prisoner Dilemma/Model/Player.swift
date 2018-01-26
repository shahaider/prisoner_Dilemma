

import GameplayKit

class Player: NSObject, GKGameModelPlayer {
  
  enum Value: Int {
    case empty
    case Human
    case Machine
    
    
    var name: String {
      switch self {
      
      case .empty:
        return ""
        
      case .Human:
        return "Human"
        
      case .Machine:
        return "Machine"
      }
    }
  }
  
  var playerValue: Value
  var name: String

// ********************* declare player ID ***********************
    var playerId: Int
  
    
    // ***************** Create ALL Player Array *********************
  static var allPlayers = [Player(.Human), Player(.Machine),Player(.empty) ]
  
    
    //  ***************** Define Opponent Value *****************
  var opponent: Player {
    if playerValue == .Machine {
      return Player.allPlayers[1]
    } else {
      return Player.allPlayers[0]
    }
  }
  
   // ***************** initilize Class *****************
  init(_ value: Value) {
    self.playerValue = value
    playerId = value.rawValue
    name = value.name
  }
  
}
