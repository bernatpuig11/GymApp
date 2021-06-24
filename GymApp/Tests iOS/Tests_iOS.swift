//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Bernat Puig Font on 9/6/21.
//

import Foundation
import XCTest

class Tests_iOS: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
       continueAfterFailure = false
       app = XCUIApplication()
       app.launchArguments = ["testing"]
       app.launch()
   }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test() {
        testValidLoginSuccess()
        testListExercise()
        testStart()
        testLevels()
        testMinutes()
        testArrow()
        testStartTimers12()
        //testAfter1minute()
        testStartTimer3()
        //testAfter2minutes()
        testNextExercise()
        testBackExercise()
        testTouch4TimesStart()
        testNextExerciseUntilExerciseDone()
        testGoHome()
        testArrivingContentView()
        testLogout()
    }
    
    func testValidLoginSuccess(){
        let Email = app.textFields["Email"]
        let pwd = app.secureTextFields["Password"]
        Email.tap()
        Email.typeText("111@gmail.com")
              
        pwd.tap()
        pwd.typeText("123456")
      

        app.buttons["Click twice"].tap()
        app.buttons["Log in"].tap()
    }
    
    func testListExercise(){
        app.buttons["List of Exercises"].tap()
        app.swipeUp()
        let searchItem = app.textFields["Search ..."]
        searchItem.tap()
        searchItem.typeText("Plank")
        XCTAssert(searchItem.waitForExistence(timeout: 5))
        app.buttons["Back"].tap()
    }
    
    func testStart() {
        app.buttons["START"].tap()
    }
    
    func testLevels() {
        app.buttons["EASY LEVEL"].tap()
        app.buttons["Back"].tap()
        app.buttons["MEDIUM LEVEL"].tap()
        app.buttons["Back"].tap()
        app.buttons["HARD LEVEL"].tap()
        app.buttons["Back"].tap()
    }
    
    func testMinutes() {
        app.buttons["EASY LEVEL"].tap()
        app.buttons["20 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["30 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["40 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["50 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["Back"].tap()
        app.buttons["MEDIUM LEVEL"].tap()
        app.buttons["20 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["30 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["40 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["50 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["Back"].tap()
        app.buttons["HARD LEVEL"].tap()
        app.buttons["20 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["30 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["40 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["50 MINUTES"].tap()
        app.buttons["Back"].tap()
        app.buttons["Back"].tap()
    }
    
    func testArrow() {
        app.buttons["EASY LEVEL"].tap()
        app.buttons["20 MINUTES"].tap()
        app.buttons["arrow.right"].tap()
    }
    
    func testStartTimers12() {
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer2 = app.staticTexts.element(boundBy: 2)
        let timer3 = app.staticTexts.element(boundBy: 3)
        XCTAssertTrue(timer1.label.isEqual("00:00"))
        XCTAssertTrue(timer2.label.isEqual("01:00"))
        XCTAssertTrue(timer3.label.isEqual("02:00"))
        sleep(5)
        XCTAssertFalse(timer1.label.isEqual("00:00"))
        XCTAssertFalse(timer2.label.isEqual("01:00"))
        XCTAssertTrue(timer3.label.isEqual("02:00"))
    }
    
    func testAfter1minute() {
        sleep(60)
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer2 = app.staticTexts.element(boundBy: 2)
        let timer3 = app.staticTexts.element(boundBy: 3)
        let timer1previous = timer1.label
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        XCTAssertTrue(timer3.label.isEqual("02:00"))
        sleep(5)
        XCTAssertFalse(timer1.label.isEqual(timer1previous))
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        XCTAssertTrue(timer3.label.isEqual("02:00"))
    }
    
    func testStartTimer3() {
        app.buttons["START"].tap()
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer2 = app.staticTexts.element(boundBy: 2)
        let timer3 = app.staticTexts.element(boundBy: 3)
        let timer1previous = timer1.label
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        let timer3previous = timer3.label
        sleep(5)
        XCTAssertFalse(timer1.label.isEqual(timer1previous))
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        XCTAssertFalse(timer3.label.isEqual(timer3previous))
    }
    
    func testAfter2minutes() {
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer2 = app.staticTexts.element(boundBy: 2)
        let timer3 = app.staticTexts.element(boundBy: 3)
        let timer1previous = timer1.label
        sleep(120)
        XCTAssertFalse(timer1.label.isEqual(timer1previous))
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        XCTAssertTrue(timer3.label.isEqual("00:00"))
    }
    
    func testNextExercise() {
        let timer1Previous = app.staticTexts.element(boundBy: 1)
        let timer1previous = timer1Previous.label
        let imagePreviousExercise = app.images.element(boundBy: 1)
        let imagePreviousExerciseLabel = imagePreviousExercise.label
        app.buttons["arrow.right"].tap()
        let timer2 = app.staticTexts.element(boundBy: 2)
        let timer2start = timer2.label
        sleep(5)
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer3 = app.staticTexts.element(boundBy: 3)
        let imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        XCTAssertFalse(timer1.label.isEqual(timer1previous))
        XCTAssertFalse(timer2.label.isEqual(timer2start))
        XCTAssertTrue(timer3.label.isEqual("02:00"))
    }
    
    func testBackExercise() {
        app.buttons["Back"].tap()
        var title = app.staticTexts.element(boundBy: 1)
        XCTAssertTrue(title.label.isEqual("START WORKOUT"))
        app.buttons["arrow.right"].tap()
        app.buttons["arrow.right"].tap()
        app.buttons["arrow.right"].tap()
        app.buttons["arrow.right"].tap()
        app.buttons["arrow.right"].tap()
        app.buttons["Back"].tap()
        title = app.staticTexts.element(boundBy: 1)
        XCTAssertTrue(title.label.isEqual("START WORKOUT"))
    }
    
    func testTouch4TimesStart() {
        app.buttons["arrow.right"].tap()
        app.buttons["START"].tap()
        app.buttons["START"].tap()
        app.buttons["START"].tap()
        app.buttons["START"].tap()
        let timer1 = app.staticTexts.element(boundBy: 1)
        let timer3 = app.staticTexts.element(boundBy: 3)
        let timer1start = timer1.label
        let timer3start = timer3.label
        let arraytimer1 = timer1start.map { String($0) }
        let arraytimer3 = timer3start.map { String($0) }
        let secondsStringTimer1 = arraytimer1[3] + arraytimer1[4]
        let secondsStringTimer3 = arraytimer3[3] + arraytimer3[4]
        let secondsStartTimer1 = Int(secondsStringTimer1)
        let secondsStartTimer3 = Int(secondsStringTimer3)
        sleep(5)
        let timer1after = timer1.label
        let timer3after = timer3.label
        let array2timer1 = timer1after.map { String($0) }
        let array2timer3 = timer3after.map { String($0) }
        let seconds2StringTimer1 = array2timer1[3] + array2timer1[4]
        let seconds2StringTimer3 = array2timer3[3] + array2timer3[4]
        var secondsAfterTimer1 = Int(seconds2StringTimer1)
        var secondsAfterTimer3 = Int(seconds2StringTimer3)
        if secondsAfterTimer1 ?? 59 == 4 {
            secondsAfterTimer1 = 58 + (secondsAfterTimer1 ?? 59)
        }
        else if secondsAfterTimer1 ?? 59 == 3 {
            secondsAfterTimer1 = 57 + (secondsAfterTimer1 ?? 59)
        }
        else if secondsAfterTimer1 ?? 59 == 2 {
            secondsAfterTimer1 = 56 + (secondsAfterTimer1 ?? 59)
        }
        else if secondsAfterTimer1 ?? 59 == 1 {
            secondsAfterTimer1 = 55 + (secondsAfterTimer1 ?? 59)
        }
        else if secondsAfterTimer1 ?? 59 == 0 {
            secondsAfterTimer1 = 54 + (secondsAfterTimer1 ?? 59)
        }
        XCTAssertTrue(secondsStartTimer1 ?? 59 < secondsAfterTimer1 ?? 00)
        XCTAssertTrue(secondsStartTimer3 ?? 00 > secondsAfterTimer3 ?? 59)
        secondsAfterTimer1 = (secondsAfterTimer1 ?? 59) - 5
        secondsAfterTimer3 = 5 + (secondsAfterTimer3 ?? 59)
        XCTAssertTrue(secondsStartTimer1 ?? 00 == secondsAfterTimer1 ?? 59)
        XCTAssertTrue(secondsStartTimer3 ?? 00 == secondsAfterTimer3 ?? 59)
        let timer2 = app.staticTexts.element(boundBy: 2)
        XCTAssertFalse(timer1.label.isEqual(timer1start))
        XCTAssertTrue(timer2.label.isEqual("00:00"))
        XCTAssertFalse(timer3.label.isEqual("02:00"))
    }
    
    func testNextExerciseUntilExerciseDone() {
        sleep(1)
        var imageExercise = app.images.element(boundBy: 1)
        var imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
        imageExercise = app.images.element(boundBy: 1)
        XCTAssertFalse(imageExercise.label.isEqual(imagePreviousExerciseLabel))
        imagePreviousExerciseLabel = imageExercise.label
        app.buttons["arrow.right"].tap()
    }
    
    func testGoHome() {
        app.buttons["GO HOME"].tap()
    }
    
    func testArrivingContentView() {
        XCTAssertFalse(app.buttons["Back"].exists)
    }
    
    func testLogout(){
        app.buttons["Log out"].tap()
    }
}
