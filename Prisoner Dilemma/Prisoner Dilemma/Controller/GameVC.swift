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
    var cooperatingPointScore = 0
    var defectingPointScore = 0
    var cooperate_defectMaxPoint = 0
    var cooperate_defectMinPoint = 0
    
    var displayPoint:[Int] = []

    // ************* Outlet Variable ****************
    
    
    
    //                              POINT DISPLAY LABEL POSITION
    
    @IBOutlet weak var player1_UpLeft: UILabel!
    @IBOutlet weak var player2_UpLeft: UILabel!
    
    @IBOutlet weak var player1_BottomLeft: UILabel!
    @IBOutlet weak var player2_BottomLeft: UILabel!
    
    
    @IBOutlet weak var player1_UpRight: UILabel!
    @IBOutlet weak var player2_UpRight: UILabel!
    
    @IBOutlet weak var player1_BottomRight: UILabel!
    @IBOutlet weak var player2_BottomRight: UILabel!
    
    //                              ITERATION IMAGE

    // PLAYER 1:
    
      @IBOutlet weak var player1_Iteration1_Image: UIImageView!
      @IBOutlet weak var player1_Iteration2_Image: UIImageView!
      @IBOutlet weak var player1_Iteration3_Image: UIImageView!
      @IBOutlet weak var player1_Iteration4_Image: UIImageView!
      @IBOutlet weak var player1_Iteration5_Image: UIImageView!
      @IBOutlet weak var player1_Iteration6_Image: UIImageView!
      @IBOutlet weak var player1_Iteration7_Image: UIImageView!
      @IBOutlet weak var player1_Iteration8_Image: UIImageView!
      @IBOutlet weak var player1_Iteration9_Image: UIImageView!
      @IBOutlet weak var player1_Iteration10_Image: UIImageView!
    
    // PLAYER 2:
    
      @IBOutlet weak var player2_Iteration1_Image: UIImageView!
      @IBOutlet weak var player2_Iteration2_Image: UIImageView!
      @IBOutlet weak var player2_Iteration3_Image: UIImageView!
      @IBOutlet weak var player2_Iteration4_Image: UIImageView!
      @IBOutlet weak var player2_Iteration5_Image: UIImageView!
      @IBOutlet weak var player2_Iteration6_Image: UIImageView!
      @IBOutlet weak var player2_Iteration7_Image: UIImageView!
      @IBOutlet weak var player2_Iteration8_Image: UIImageView!
      @IBOutlet weak var player2_Iteration9_Image: UIImageView!
      @IBOutlet weak var player2_Iteration10_Image: UIImageView!
    
    
    //                              ITERATION POINT ACHEIVED

    // PLAYER 1:
    @IBOutlet weak var player1_iteration1_Point: UILabel!
    @IBOutlet weak var player1_iteration2_Point: UILabel!
    @IBOutlet weak var player1_iteration3_Point: UILabel!
    @IBOutlet weak var player1_iteration4_Point: UILabel!
    @IBOutlet weak var player1_iteration5_Point: UILabel!
    @IBOutlet weak var player1_iteration6_Point: UILabel!
    @IBOutlet weak var player1_iteration7_Point: UILabel!
    @IBOutlet weak var player1_iteration8_Point: UILabel!
    @IBOutlet weak var player1_iteration9_Point: UILabel!
    @IBOutlet weak var player1_iteration10_Point: UILabel!

    @IBOutlet weak var player1_Total: UILabel!
    
    //PLAYER 2:
    
    @IBOutlet weak var player2_iteration1_Point: UILabel!
    @IBOutlet weak var player2_iteration2_Point: UILabel!
    @IBOutlet weak var player2_iteration3_Point: UILabel!
    @IBOutlet weak var player2_iteration4_Point: UILabel!
    @IBOutlet weak var player2_iteration5_Point: UILabel!
    @IBOutlet weak var player2_iteration6_Point: UILabel!
    @IBOutlet weak var player2_iteration7_Point: UILabel!
    @IBOutlet weak var player2_iteration8_Point: UILabel!
    @IBOutlet weak var player2_iteration9_Point: UILabel!
    @IBOutlet weak var player2_iteration10_Point: UILabel!

    @IBOutlet weak var player2_Total: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startGame()

        
    }

    
    func startGame(){
        
        let scorePoints = BoardPoint()
        self.displayPoint = scorePoints.display()
        
        print(self.displayPoint)
        
        var sortedValue = self.displayPoint.sorted()
        print(sortedValue)
        
        cooperate_defectMinPoint = sortedValue[0]
        defectingPointScore = sortedValue[1]
        cooperatingPointScore = sortedValue[2]
        cooperate_defectMaxPoint = sortedValue[3]
        
        player1_UpLeft.text = String(cooperatingPointScore)
        player1_BottomLeft.text = String(cooperate_defectMaxPoint)
        player1_UpRight.text = String(cooperate_defectMinPoint)
        player1_BottomRight.text = String(defectingPointScore)
        
        player2_UpLeft.text = String(cooperatingPointScore)
        player2_BottomLeft.text = String(cooperate_defectMinPoint)
        player2_UpRight.text = String(cooperate_defectMaxPoint)
        player2_BottomRight.text = String(defectingPointScore)
    }
  
    
    @IBAction func REFRESH(_ sender: Any) {
        self.displayPoint.removeAll()
        self.startGame()
        
    }
    
    
    
    // ********** Action on pressing Cooperation ********
    @IBAction func cooperateButton(_ sender: Any) {
        
    }
    
    // ********** Action on pressing Defect ********

    @IBAction func defectButton(_ sender: Any) {
        
    }
    
}
