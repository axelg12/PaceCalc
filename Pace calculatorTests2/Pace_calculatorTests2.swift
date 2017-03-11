//
//  Pace_calculatorTests2.swift
//  Pace calculatorTests2
//
//  Created by Axel Gislason on 01/03/2017.
//  Copyright © 2017 Axel Gislason. All rights reserved.
//

import XCTest
@testable import Pace_calculator


class Pace_calculatorTests2: XCTestCase {
    
    var distanceController: DistanceController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testDistanceCalc() {
        distanceController.paceMinutes.text = "6"
        distanceController.onCalcDist("a")
        XCTAssert((distanceController.distance.text != nil), "06:00")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
