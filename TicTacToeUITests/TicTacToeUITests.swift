//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by dillon on 11/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    func testLeftVertical() {
        
        /// D.R.Y. - Don't Repeat Yourself - whenever you see code and wnat to copy it, dont!! -> use a function!
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // X starts game
        app.assertMovePlayed(.topLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.topRight, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        app.assertMovePlayed(.middleLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.middleRight, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        
        // X wins
        let bottomLeft = app.buttons["bottomLeft"]
        bottomLeft.tap()
        XCTAssertEqual(bottomLeft.label, "X")
        XCTAssertEqual(app.staticTexts["statusLabel"].label, "Player X won!")
    }
    
    
    func testDiagonalWin() {
        
        /// D.R.Y. - Don't Repeat Yourself - whenever you see code and wnat to copy it, dont!! -> use a function!
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // X starts game
        app.assertMovePlayed(.topLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.bottomLeft, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        app.assertMovePlayed(.middleCenter, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        app.assertMovePlayed(.topRight, buttonLabelAssertionString: .O, nextPlayerAssertionString: .X)
        
        // X wins
        let bottomRight = app.buttons["bottomRight"]
        bottomRight.tap()
        XCTAssertEqual(bottomRight.label, "X")
        XCTAssertEqual(app.staticTexts["statusLabel"].label, "Player X won!")
        
    }
    
    func testResetGame() {
        let app = XCUIApplication()
        app.launch()
        
        //Make a mark on board
        app.assertMovePlayed(.topLeft, buttonLabelAssertionString: .X, nextPlayerAssertionString: .O)
        
        let button = app.buttons["restartButton"]
        button.tap()
        
        let statusLabel = app.staticTexts["statusLabel"]
        XCTAssertEqual(statusLabel.label, "Player X's turn")
        
    }
    
}



extension XCUIApplication {
    
    var statusElement: XCUIElement {
        return staticTexts["statusLabel"]
    }
    
    func assertMovePlayed(_ buttonIdentifier: PositionIdentifier,
                          buttonLabelAssertionString: ButtonLabel,
                          nextPlayerAssertionString: ButtonLabel) {
        let button = buttons[buttonIdentifier.rawValue]
        button.tap()
        XCTAssertEqual(button.label, buttonLabelAssertionString.rawValue)
        XCTAssertEqual(statusElement.label, "Player \(nextPlayerAssertionString.rawValue)'s turn")
    }
    
    enum PositionIdentifier: String {
        case topLeft
        case topCenter
        case topRight
        case middleLeft
        case middleCenter
        case middleRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    
    enum ButtonLabel: String {
        case X
        case O
    }
}
