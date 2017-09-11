//
//  ___________FoodTrackerTests.swift
//  상품명: FoodTrackerTests
//
//  Created by 박수연 on 2017. 9. 10..
//  Copyright © 2017년 박수연. All rights reserved.
//

import XCTest
@testable import ___________FoodTracker

class ___________FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //MARK: Meal Class Tests
        
        // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
        func testMealInitializationSucceeds() {
            
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
     // Negative rating
    let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
    XCTAssertNil(negativeRatingMeal)
    
    // Empty String
    let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
    XCTAssertNil(emptyStringMeal)   
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
