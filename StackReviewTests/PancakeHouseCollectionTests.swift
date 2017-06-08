//
//  PancakeHouseCollectionTests.swift
//  StackReview
//
//  Created by Aoife on 08/06/2017.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest
@testable import StackReview

class PancakeHouseCollectionTests: XCTestCase {
    
    //Set Up
    override func setUp() {
        super.setUp()
        collection = PancakeHouseCollection()
        
        let bundle = Bundle(for: PancakeHouseCollectionTests.self)
        collection.loadPancakeHouses("test_pancake_houses", in: bundle)
    }
    
    var collection: PancakeHouseCollection!
   
    //Test
    func test_collection_HasExpectedItemsCount_true(){
        
        XCTAssert(collection.count == 3, "Collection didn't have expected number of items")
        
    }
    
    //Test for correct values at index 0
    func test_firstPancakeHouse_hasExpectedValues_true(){
        checkPancakeHousehasExpectedValues(index: 0)
    }
    
    //Test for correct values at index 1
    func test_secondPancakeHouse_hasExpectedValues_true(){
        checkPancakeHousehasExpectedValues(index: 1)
    }
    
    //Test for correct values at index 2
    func test_thirdPancakeHouse_hasExpectedValues_true(){
        checkPancakeHousehasExpectedValues(index: 2)
    }
    
    //Test adding pancake house works
    func test_addPancakeHouse_newHouse_isAdded(){
        // given
        let dict: [String: Any] = ["name": "Test Pancake House",
                                   "priceGuide": 1,
                                   "rating": 1,
                                   "details": "Test"]
        let pancakeHouse = PancakeHouse(dictionary: dict)!
        
        // when
        collection.addPancakeHouse(pancakeHouse)
        
        // then
        XCTAssertTrue(collection._pancakeHouses.contains(pancakeHouse))
        
    }
    
    //Test removing pancake house works
    func test_removePancakeHouse_House_isRemoved() {
        // given
        let pancakeHouse = collection[0]
        
        // when
        try!
        collection.removePancakeHouse(pancakeHouse)
        
        // then
        XCTAssertFalse(collection._pancakeHouses.contains(pancakeHouse))
    }
    
    //Check values are correct
    func checkPancakeHousehasExpectedValues(index: Int){
        let pancakeHouse = collection[index]
        let pListIndex = index + 1
        XCTAssertEqual(pancakeHouse.name, "name \(pListIndex)")
        XCTAssertEqual(pancakeHouse.details, "details \(pListIndex)")
        XCTAssertEqual(pancakeHouse.photo, UIImage (named: "pancake\(pListIndex)"))
    }
    
}
