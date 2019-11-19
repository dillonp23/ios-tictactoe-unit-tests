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
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        
        if gameIsOver == true {
            NSLog("Game is over!")
            return
        }
        
        if activePlayer == .x {
            try board.place(mark: .x, on: coordinate)
            if game(board: board, isWonBy: player) == true {
                winningPlayer = player
                gameIsOver = true
            } else {
                activePlayer = .o
            }
        } else if activePlayer == .o {
            try board.place(mark: .o, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                gameIsOver = true
            } else {
                activePlayer = .x
            }
        }
    }

    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
}
