//
//  Game.swift
//  TicTacToe
//
//  Created by dillon on 11/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        winningPlayer = nil
        catsGame = false
        gameIsOver = false
        NSLog("Game reset, player x's turn!")
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        if gameIsOver == true {
            NSLog("Game is over! Press Restart to play again!")
            return
        }
        
        if activePlayer == .x {
            try board.place(mark: .x, on: coordinate)
            if game(board: board, isWonBy: player) == true {
                winningPlayer = player
                gameIsOver = true
                activePlayer = nil
                NSLog("Player X wins the game")
                return
            } else if board.isFull == true {
                gameIsOver = true
                activePlayer = nil
                winningPlayer = nil
                catsGame = true
                NSLog("It's a Cat's game!")
                return
            } else {
                activePlayer = .o
                return
            }
        } else if activePlayer == .o {
            try board.place(mark: .o, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                gameIsOver = true
                activePlayer = nil
                NSLog("Player O wins the game")
                return
            } else if board.isFull == true {
                gameIsOver = true
                activePlayer = nil
                winningPlayer = nil
                catsGame = true
                NSLog("It's a Cat's game!")
                return
            }
            else {
                activePlayer = .x
                return
            }
        }
    }
    
    private func playerWon(player: GameBoard.Mark) {
        
    }

    private(set) var board: GameBoard = GameBoard()

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark?
    internal var catsGame: Bool = false
    
}
