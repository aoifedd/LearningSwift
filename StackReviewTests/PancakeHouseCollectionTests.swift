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
    func test_collection_HasExpectedItemsCount_false(){
        
        XCTAssert(collection.count != 1, "Collection had expected number of items")
    
    }
   
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
    
    //Check values are correct
    func checkPancakeHousehasExpectedValues(index: Int){
        let pancakeHouse = collection[index]
        let pListIndex = index + 1
        XCTAssertEqual(pancakeHouse.name, "name \(pListIndex)")
        XCTAssertEqual(pancakeHouse.details, "details \(pListIndex)")
        XCTAssertEqual(pancakeHouse.photo, UIImage (named: "pancake\(pListIndex)"))
    }
    
}
