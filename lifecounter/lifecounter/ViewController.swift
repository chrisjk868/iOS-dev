//
//  ViewController.swift
//  lifecounter
//
//  Created by Christopher Ku on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Score labels:
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    
    // Player 1 Buttons:
    @IBOutlet weak var playerOnePlusOneButton: UIButton!
    @IBOutlet weak var playerOneMinusOneButton: UIButton!
    @IBOutlet weak var playerOnePlusFiveButton: UIButton!
    @IBOutlet weak var playerOneMinusFiveButton: UIButton!
    
    // Player 2 Buttons:
    @IBOutlet weak var playerTwoPlusOneButton: UIButton!
    @IBOutlet weak var playerTwoMinusOneButton: UIButton!
    @IBOutlet weak var playerTwoPlusFiveButton: UIButton!
    @IBOutlet weak var playerTwoMinusFiveButton: UIButton!
    
    // End game label:
    @IBOutlet weak var endGameLabel: UILabel!
    
    // Player scores data:
    var playerOneScore : Int = 1
    var playerTwoScore : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        endGameLabel.text = ""
        endGameLabel.isHidden = true
        playerOneScoreLabel.text = "Score: \(playerOneScore)"
        playerTwoScoreLabel.text = "Score: \(playerTwoScore)"
    }
    
    func evaluate() {
        if playerOneScore <= 0 || playerTwoScore <= 0 {
            playerOnePlusOneButton.isEnabled = false
            playerOneMinusOneButton.isEnabled = false
            playerOnePlusFiveButton.isEnabled = false
            playerOneMinusFiveButton.isEnabled = false
            playerTwoPlusOneButton.isEnabled = false
            playerTwoMinusOneButton.isEnabled = false
            playerTwoPlusFiveButton.isEnabled = false
            playerTwoMinusFiveButton.isEnabled = false
        }
        if playerOneScore <= 0 {
            endGameLabel.text = "Player 1 LOSES!"
            endGameLabel.isHidden = false
        }
        if playerTwoScore <= 0 {
            endGameLabel.text = "Player 2 LOSES!"
            endGameLabel.isHidden = false
        }
    }
    
    // Player 1 +
    @IBAction func p1PlusOneBtnClick(_ sender: Any) {
        playerOneScore += 1
        playerOneScoreLabel.text = "Score: \(playerOneScore)"
        evaluate()
    }
    
    // Player 1 -
    @IBAction func p1MinusOneBtnClick(_ sender: Any) {
        playerOneScore -= 1
        playerOneScoreLabel.text = "Score: \(playerOneScore)"
        evaluate()
    }
    
    // Player 1 +5
    @IBAction func p1PlusFiveBtnClick(_ sender: Any) {
        playerOneScore += 5
        playerOneScoreLabel.text = "Score: \(playerOneScore)"
        evaluate()
    }
    
    // Player 1 -5
    @IBAction func p1MinusFiveBtnClick(_ sender: Any) {
        playerOneScore -= 5
        playerOneScoreLabel.text = "Score: \(playerOneScore)"
        evaluate()
    }
    
    // Player 2 +
    @IBAction func p2PlusOneBtnClick(_ sender: Any) {
        playerTwoScore += 1
        playerTwoScoreLabel.text = "Score: \(playerTwoScore)"
        evaluate()
    }
    
    // Player 2 -
    @IBAction func p2MinusOneBtnClick(_ sender: Any) {
        playerTwoScore -= 1
        playerTwoScoreLabel.text = "Score: \(playerTwoScore)"
        evaluate()
    }
    
    // Player 2 +5
    @IBAction func p2PlusFiveBtnClick(_ sender: Any) {
        playerTwoScore += 5
        playerTwoScoreLabel.text = "Score: \(playerTwoScore)"
        evaluate()
    }
    
    // Player 2 -5
    @IBAction func p2MinusFiveBtnClick(_ sender: Any) {
        playerTwoScore -= 5
        playerTwoScoreLabel.text = "Score: \(playerTwoScore)"
        evaluate()
    }
    
    
}

