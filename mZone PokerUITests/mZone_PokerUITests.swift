//
//  mZone_PokerUITests.swift
//  mZone PokerUITests
//
//  Created by Michael Henry on 3/12/16.
//  Copyright © 2016 BHouse. All rights reserved.
//

import XCTest

class mZone_PokerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.textFields.containingType(.Button, identifier:"Clear text").element.typeText("2157")
        app.buttons["WHAT SHOULD I DO?"].tap()
        app.alerts["Action Required"].collectionViews.buttons["Ok"].tap()
        snapshot("01LoginScreen")
       
        let clearTextTextField = app.textFields.containingType(.Button, identifier:"Clear text").element
        clearTextTextField.typeText("25463")
        app.keys["Delete"].tap()
        snapshot("02LoginScreen")
        clearTextTextField.typeText("8")
        
        let element = app.otherElements.containingType(.Image, identifier:"HeaderImage").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.childrenMatchingType(.TextField).elementBoundByIndex(1).tap()
        clearTextTextField.typeText("58455")
        app.buttons["WHAT SHOULD I DO?"].tap()
        snapshot("03LoginScreen")
        
        let recommendationAlert = app.alerts["Recommendation"]
        let okButton = recommendationAlert.collectionViews.buttons["Ok"]
        okButton.tap()
        clearTextTextField.typeText("5522")
        element.childrenMatchingType(.TextField).elementBoundByIndex(0).tap()
        clearTextTextField.typeText("21")
        app.keys["1"].tap()
        clearTextTextField.typeText("111")
        app.typeText("1")
        recommendationAlert.staticTexts["Recommendation"].tap()
        okButton.tap()
        snapshot("04LoginScreen")
        
    }
    
}
