//
//  ConsultaRepositoriosUITests.swift
//  ConsultaRepositoriosUITests
//
//  Created by Kleyton Prestes Stringhetta on 20/10/19.
//  Copyright © 2019 Breno Carvalho de Morais. All rights reserved.
//

import XCTest

class ConsultaRepositoriosUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testExample() {
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["estrelas: 5754"]/*[[".cells.staticTexts[\"estrelas: 5754\"]",".staticTexts[\"estrelas: 5754\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()

    }

}
