

import GameplayKit

class Player: NSObject {
  
    
// Creating Enum for Player
  enum mainPlayer: Int {
    case empty
    case Human
    case Machine
    
    
    // Assigning Name To Players
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
  
    
    // initializing Variable
  var value: mainPlayer
  var name: String
  
    
    // Assosicating All-Player into Array
  static var allPlayers = [
    Player(.Human),
    Player(.Machine)
  ]
  
    // Describing Oppenent
  var opponent: Player {
    if value == .Machine {
      return Player.allPlayers[0]
    } else {
      return Player.allPlayers[1]
    }
  }
  
  init(_ value: mainPlayer) {
    self.value = value
    name = value.name
  }
  
}
