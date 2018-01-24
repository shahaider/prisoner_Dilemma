//
//  GameVC.swift
//  Prisoner Dilemma
//
//  Created by Syed ShahRukh Haider on 22/01/2018.
//  Copyright © 2018 Syed ShahRukh Haider. All rights reserved.
//

import UIKit
import GameplayKit

class GameVC: UIViewController {

    // ************* VC variable *****************
    var defect_cooperarte = 0
    var defect_defect = 0
    var cooperate_cooperate = 0
    var cooperate_defect = 0
    
    var displayPoint:[Int] = []

    
    let board  = Board()
    // ************* Outlet Variable ****************
    
    
    
    /*
     
     
            POINT DISPLAY LABEL POSITION
     
     */
    

    
    @IBOutlet var upLeftSet: [UILabel]!

    @IBOutlet var bottomLeftSet: [UILabel]!
  
    @IBOutlet var upRightSet: [UILabel]!

    @IBOutlet var bottomRightSet: [UILabel]!

    
    
    
    
    
    /*
 
 
                ITERATION IMAGE

    */
    
    
    // PLAYER 1:
    
    @IBOutlet var player1_Interation_Image: [UIImageView]!
    
    @IBOutlet var player1_Interation_Score: [UILabel]!
    
    @IBOutlet weak var player1_Total: UILabel!
    
    
    
    
    //PLAYER 2:
    
    @IBOutlet var player2_Interation_Image: [UIImageView]!
    
    @IBOutlet var player2_Interation_Score: [UILabel]!

    @IBOutlet weak var player2_Total: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startGame()

        
    }

    
    
    // Function that will Start Game
    func startGame(){
        
        let scorePoints = Board()
        self.displayPoint = scorePoints.display()
        
        print(self.displayPoint)
        
        var sortedValue = self.displayPoint.sorted()
        print(sortedValue)
        
        cooperate_defect = sortedValue[0]
        defect_defect = sortedValue[1]
        cooperate_cooperate = sortedValue[2]
        defect_cooperarte = sortedValue[3]
        

        
        // FILLING POINTS TO RESPECTIVE PLACE ON BOARD
        
        upLeftSet[0].text = String(cooperate_cooperate)
        upLeftSet[1].text = String(cooperate_cooperate)
        
        bottomLeftSet[0].text = String(defect_cooperarte)
        bottomLeftSet[1].text = String(cooperate_defect)
        
        upRightSet[0].text = String(cooperate_defect)
        upRightSet[1].text = String(defect_cooperarte)
        
        bottomRightSet[0].text = String(defect_defect)
        bottomRightSet[1].text = String(defect_defect)
        

    }
  
    
    @IBAction func REFRESH(_ sender: Any) {
        self.displayPoint.removeAll()
        
        self.startGame()
        
    }
    
    
    
    // ********** Action on pressing Cooperation ********
   
    @IBAction func DecisionButton(_ sender: UIButton) {
        
        if sender.tag == 0{
            
            // send Cooperate VALUE = 0
        }
        else{
            
            // send Defect Value = 1
        }
    }
    
    
    
    fileprivate func updateGame() {
        var gameOverTitle: String? = nil
        
        if let winner = board.playerScoring, winner == board.currentPlayer {
            gameOverTitle = "\(winner.name) Wins!"
        } else if board.isComplete {
            gameOverTitle = "Draw"
        }
        
        if gameOverTitle != nil {
            let alert = UIAlertController(title: gameOverTitle, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Play Again", style: .default) { _ in
                self.updateGame()
            }
            
            alert.addAction(alertAction)
            view?.window?.rootViewController?.present(alert, animated: true)
            
            return
        }
        
        board.currentPlayer = board.currentPlayer.opponent
        
        
        // A.I
        if board.currentPlayer.playerValue == .Machine {
//            processAIMove()
        }
    }
    
    
    //                  " UPDATE GAME BOARD STATUS "
    
    fileprivate func updateBoard(taken x: Int) {
        guard board[x] == .empty else { return }
        
        board[x] = board.currentPlayer.playerValue
        
//        let sizeValue = boardNode.size.width / 3 - 20
//        let spriteSize = CGSize(
//            width: sizeValue,
//            height: sizeValue
//        )
//        
//        var nodeImageName: String
//        
//        if board.currentPlayer.value == .zombie {
//            nodeImageName = "zombie-head"
//        } else {
//            nodeImageName = "brain"
//        }
//        
//        let pieceNode = SKSpriteNode(imageNamed: nodeImageName)
//        pieceNode.size = CGSize(
//            width: spriteSize.width / 2,
//            height: spriteSize.height / 2
//        )
//        pieceNode.position = position(for: CGPoint(x: x, y: y))
//        addChild(pieceNode)
//        
//        gamePieceNodes.append(pieceNode)
//        
//        pieceNode.run(SKAction.scale(by: 2, duration: 0.25))
        
        updateGame()
    }
    
}
