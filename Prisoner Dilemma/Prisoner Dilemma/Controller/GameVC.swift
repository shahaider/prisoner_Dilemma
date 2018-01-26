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
    var sortedPoint:[Int] = []

    var iteration = 0
    var humanAction = 0
    
    
    var player1Move: [Int] = []
    var player2Move : [Int] = []
    
    let board  = Board()
    
    // A.I
    var strategist = Strategist()
    
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
        player1_Total.isHidden = true
        player2_Total.isHidden = true
        self.startGame()
    
        
    }

    
    
    // Function that will Start Game
    func startGame(){
        
        let scorePoints = Board()
        self.displayPoint = scorePoints.display()
        
//        print(self.displayPoint)
        
        sortedPoint = self.displayPoint.sorted()

        //        print(sortedPoint)
        
        cooperate_defect = sortedPoint[0]
        defect_defect = sortedPoint[1]
        cooperate_cooperate = sortedPoint[2]
        defect_cooperarte = sortedPoint[3]
        

        
        // FILLING POINTS TO RESPECTIVE PLACE ON BOARD
        
        upLeftSet[0].text = String(cooperate_cooperate)
        upLeftSet[1].text = String(cooperate_cooperate)
        
        bottomLeftSet[0].text = String(defect_cooperarte)
        bottomLeftSet[1].text = String(cooperate_defect)
        
        upRightSet[0].text = String(cooperate_defect)
        upRightSet[1].text = String(defect_cooperarte)
        
        bottomRightSet[0].text = String(defect_defect)
        bottomRightSet[1].text = String(defect_defect)
        
        
        
        
        board.currentPlayer.playerValue = .Human

    }
  
    
    @IBAction func REFRESH(_ sender: Any) {
        self.reset()
    }
    
    
    
    // ********** Action on pressing Cooperation ********
   
    @IBAction func decisionButton(_ sender: UIButton) {

            updateBoard(taken: sender.tag)

    }
    

//

    
    
    //                  " UPDATE GAME BOARD STATUS "
    
    fileprivate func updateBoard(taken action: Int) {

        let checkIterationCount = board.isComplete(iteration: iteration)
        
       if checkIterationCount == false  {
        
        if board.currentPlayer.playerValue == .Machine {
            

            let combineDecision = board.checkPlayerDecision(playerOneDecision: humanAction, playTwoDecision: action,Score: self.sortedPoint )
            
           
            
            if action == 0{
                player2_Interation_Image[iteration].image = UIImage(named: "cooperate")
                //
                board.currentPlayer.playerValue = .Human
                
//                print(combineDecision)

                player1_Interation_Score[iteration].text = String(combineDecision.0)
                
                player2_Interation_Score[iteration].text = String(combineDecision.1)
                
                if iteration == 9 {
                    self.generateResult()
                }
                iteration += 1
                
         
                
                

                
            }
                
                
            else{
                
                player2_Interation_Image[iteration].image = UIImage(named: "defect")
                
                board.currentPlayer.playerValue = .Human
                
                print(combineDecision)

                player1_Interation_Score[iteration].text = String(combineDecision.0)
                
                player2_Interation_Score[iteration].text = String(combineDecision.1)
                
                
                
                if iteration == 9 {
                    self.generateResult()
                }
                iteration += 1

                
            }
            
            
            
            //**************************************
            
                        }
//
            
            
        else{
            
            humanAction = action
            
            if action == 0{
                player1_Interation_Image[iteration].image = UIImage(named: "cooperate")
                //
                board.currentPlayer.playerValue = .Machine

                processAIMove()


            }
                
                
            else{
                
                player1_Interation_Image[iteration].image = UIImage(named: "defect")
                board.currentPlayer.playerValue = .Machine
                
                processAIMove()


            }
            
            
        }
  
        
    }
        
       
    }
    
    
    func reset(){
        
        self.iteration = 0
        
        self.displayPoint.removeAll()
        board.humanSum = 0
        board.machineSum = 0
      
        
        for loop in 0 ... 9{
            
            self.player1_Interation_Image[loop].image =  UIImage(named: "blank")
            self.player2_Interation_Image[loop].image =  UIImage(named: "blank")
            
            self.player1_Interation_Score[loop].text = "0"
            self.player2_Interation_Score[loop].text = "0"

        }
        
        player1_Total.isHidden = true
        player2_Total.isHidden = true

        
        
        self.startGame()
        
    }
    
    
    
    func generateResult(){
        
        print("*********** DONE  ***************")
        
        var winnerid : Int = 2
        
        player1_Total.text = String(board.humanSum)
        player2_Total.text = String(board.machineSum)
        
        player1_Total.isHidden = false
        player2_Total.isHidden = false
        
        if board.humanSum > board.machineSum{
            winnerid = 0
        }
        else if board.humanSum < board.machineSum{
            winnerid = 1
        }
        else{
            let alertVC = UIAlertController(title: "Result", message: "DRAW", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Play Again", style: .default, handler: { (action) in
                
                self.reset()
            })
            alertVC.addAction(alertAction)
            view?.window?.rootViewController?.present(alertVC, animated: true)
            
            return
        }
        
        let alertVC = UIAlertController(title: "Result", message: String(Player.allPlayers[winnerid].name), preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Play Again", style: .default, handler: { (action) in
            
            self.reset()
        })
        alertVC.addAction(alertAction)
        view?.window?.rootViewController?.present(alertVC, animated: true)
    
    }
    
    // A.I
    
     func processAIMove() {
        
        
        // Test A.I
        
//        let move = arc4random() % 2 == 0 ? 0 : 1
//
//
//        updateBoard(taken: Int(move))
        

        
        
        
        
        
        let AIDecision : Int?
//            AIDecision = strategist.MoveForPlayer()
        AIDecision = strategist.bestMoveForPlayer(player: Player.allPlayers[0])

        if let decision = AIDecision{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

//                let move = arc4random() % 2 == 0 ? 0 : 1


                self.updateBoard(taken: Int(decision))//
//                self.updateBoard(taken: decision)
                //

            }
        }
        

       
        
        
    }
    
    
}
