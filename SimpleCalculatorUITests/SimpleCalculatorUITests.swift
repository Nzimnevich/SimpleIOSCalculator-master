//
//  SimpleCalculatorUITests.swift
//  SimpleCalculatorUITests
//
//  Created by Nika Zimnevich on 29.05.2023.
//  Copyright © 2023 Alex Ilyenko. All rights reserved.
//

import XCTest

final class SimpleCalculatorUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
            // UI tests must launch the application that they test.
           // let app = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        
            
            let app = XCUIApplication()
            app.launch()
            let button = app.buttons["2"].firstMatch
            button.tap()
            app/*@START_MENU_TOKEN@*/.buttons["+"].staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
            button.tap()
            app.buttons["="].tap()

            // Use XCTAssert and related functions to verify your tests produce the correct results.
        }
    
    func testResult() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        let result = Double(app.staticTexts["4"].firstMatch.label)
        XCTAssertEqual(result,4.0,"всё оч плохо")
        }
    
    func testWrongResult() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named:UIDevice().name){ _ in }
        
        XCTContext.runActivity(named:"Операции"){ _ in
            app.buttons["2"].tap()
            app.buttons["+"].tap()
            app.buttons["2"].tap()
            app.buttons["="].tap()
        }
       
        XCTContext.runActivity(named:"Скриншот"){ _ in
            let attachment = XCTAttachment(screenshot: app.screenshot())
            attachment.name = "Launch Screen"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTContext.runActivity(named:"Ассерт"){ _ in
            let result = Double(app.staticTexts["4"].firstMatch.label)
            XCTAssertEqual(result,5.0,"всё оч плохо")
            }
        }
    
    
    func testMultiplicationResult() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named:UIDevice().name){ _ in }
        
        XCTContext.runActivity(named:"Операция умножения"){ _ in
            app.buttons["2"].tap()
            app.buttons["*"].tap()
            app.buttons["2"].tap()
            app.buttons["="].tap()
        }
       
        XCTContext.runActivity(named:"Скриншот"){ _ in
            let attachment = XCTAttachment(screenshot: app.screenshot())
            attachment.name = "Launch Screen"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTContext.runActivity(named:"Ассерт"){ _ in
            let result = Double(app.staticTexts["4"].firstMatch.label)
            XCTAssertEqual(result,4.0,"всё оч плохо")
            }
        }
    
    
    func testDevideResult() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named:UIDevice().name){ _ in }
        
        XCTContext.runActivity(named:"Операция деления"){ _ in
            app.buttons["6"].tap()
            app.buttons[":"].tap()
            app.buttons["2"].tap()
            app.buttons["="].tap()
        }
       
        XCTContext.runActivity(named:"Скриншот"){ _ in
            let attachment = XCTAttachment(screenshot: app.screenshot())
            attachment.name = "Launch Screen"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
               
        
        XCTContext.runActivity(named:"Ассерт"){ _ in
            let result = Double(app.staticTexts["3"].firstMatch.label)
            XCTAssertEqual(result,3.0,"всё оч плохо")
            }
        }
    

       
    func testDobleResult() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named:UIDevice().name){ _ in }
        //
        XCTContext.runActivity(named:"Операция сложения дробных чисел"){ _ in
            app.buttons["0"].tap()
            app.buttons["."].tap()
            app.buttons["1"].tap()
            app.buttons["+"].tap()
            app.buttons["0"].tap()
            app.buttons["."].tap()
            app.buttons["1"].tap()
            app.buttons["="].tap()
        }
       
        XCTContext.runActivity(named:"Скриншот"){ _ in
            let attachment = XCTAttachment(screenshot: app.screenshot())
            attachment.name = "Launch Screen"
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        
        XCTContext.runActivity(named:"Ассерт"){ _ in
            let result = Double(app.staticTexts["0.2"].firstMatch.label)
            XCTAssertEqual(result,0.2,"всё оч плохо")
            }
        }
    
        
      
}
