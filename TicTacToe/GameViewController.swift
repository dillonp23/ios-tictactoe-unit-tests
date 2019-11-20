//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
        updateViews()
//        gameState = .active(.x)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.restart()
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
//        guard case let GameState.active(player) = gameState else {
//            NSLog("Game is over")
//            return
//        }
        
        do {
            try game.makeMark(at: coordinate)
            
        } catch {
            NSLog("Illegal move")
        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        if game.gameIsOver {
            if game.catsGame {
                statusLabel.text = "Cat's game!"
            } else {
                if let winner = game.winningPlayer?.stringValue {
                    statusLabel.text = "Player \(winner) won!"
                }
            }
        } else {
            if let activePlayer = game.activePlayer?.stringValue {
                statusLabel.text = "Player \(activePlayer)'s turn!"
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    private var board = GameBoard() {
        didSet {
            boardViewController.board = board
        }
    }
    
    private var game = Game() {
        didSet {
            boardViewController.board = board
            updateViews()
        }
    }
    
    
}
