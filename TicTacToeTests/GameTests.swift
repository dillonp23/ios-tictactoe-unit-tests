//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by dillon on 11/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testVertical1WinByX() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         x o -
         x o -
         x - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,2))
        
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertNil(game.activePlayer)
    }
    
    func testVertical2WinByO() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         x o -
         x o -
         - o x
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (1,2))
        
        XCTAssertTrue(game.winningPlayer == .o)
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertNil(game.activePlayer)
    }
    
    func testHorizontal1WinByX() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         x x x
         o o -
         - - -
         */
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (2,0))
        
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertNil(game.activePlayer)
    }
    
    func testDiagonalWinByO() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         o x x
         x o -
         - - o
         */
        try! game.makeMark(at: (1,0))
        try! game.makeMark(at: (0,0))
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (0,1))
        try! game.makeMark(at: (2,2))
        
        XCTAssertTrue(game.winningPlayer == .o)
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertNil(game.activePlayer)
    }
    
    
    func testRestartGame() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        
        game.restart()
        
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertNil(game.winningPlayer)
    }
    
    
    func testCatsGame() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         o x x
         x o o
         o x x
         */
        try! game.makeMark(at: (1,0)) // x
        try! game.makeMark(at: (0,0)) // o
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (1,2))
        try! game.makeMark(at: (2,1))
        try! game.makeMark(at: (0,1))
        
        XCTAssertNil(game.winningPlayer)
        XCTAssertTrue(game.gameIsOver == true)
        XCTAssertNil(game.activePlayer)
        XCTAssertTrue(game.catsGame == true)
    }
    
    
    func testGameInProgress() {
        let board = GameBoard()
        var game = Game(board: board, activePlayer: .x, gameIsOver: false, winningPlayer: nil)
        /*
         o x x
         x o o
         o x x
         */
        try! game.makeMark(at: (1,0)) // x
        try! game.makeMark(at: (0,0)) // o
        try! game.makeMark(at: (2,0))
        try! game.makeMark(at: (0,2))
        try! game.makeMark(at: (2,2))
        try! game.makeMark(at: (1,1))
        try! game.makeMark(at: (1,2))
        
        
        XCTAssertNil(game.winningPlayer)
        XCTAssertTrue(game.gameIsOver == false)
        XCTAssertNotNil(game.activePlayer)
    }
    


}
