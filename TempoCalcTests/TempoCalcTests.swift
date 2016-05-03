//
//  TempoCalcTests.swift
//  TempoCalcTests
//
//  Created by Josh Smith on 10/11/15.
//  Copyright © 2015 Square One Nation, LLC. All rights reserved.
//

import XCTest
@testable import TempoCalc

class TempoCalcTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConversion()
    {
        let vc = ViewController()
        var testVal = vc.decToHex7(0)
        XCTAssert(testVal == "00 00")
        testVal = vc.decToHex7(127)
        XCTAssert(testVal == "00 7F")
        testVal = vc.decToHex7(128)
        XCTAssert(testVal == "01 00")
        testVal = vc.decToHex7(256)
        XCTAssert(testVal == "02 00")
        testVal = vc.decToHex7(300)
        XCTAssert(testVal == "02 2C")
    }
    
}
