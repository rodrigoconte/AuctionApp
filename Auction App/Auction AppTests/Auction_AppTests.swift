//
//  Auction_AppTests.swift
//  Auction AppTests
//
//  Created by Rodrigo Conte on 23/02/21.
//

import XCTest
@testable import Auction_App

class Auction_AppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testMustReceiveOneBid() {
        let auction = Auction(description: "MacbookPro 15")
        XCTAssertEqual(0, auction.throwsOfAuction?.count)
        
        let userOne = User(name: "User One")
        auction.purpose(value: Throw(userOne, 2000.0))
        
        XCTAssertEqual(1, auction.throwsOfAuction?.count)
        XCTAssertEqual(2000.0, auction.throwsOfAuction?.first?.value)
        
    }
    
    func testMustReceiveMultipleBids() {
        let auction = Auction(description: "Xbox Series X")
        XCTAssertEqual(0, auction.throwsOfAuction?.count)
        
        let userOne = User(name: "User One")
        auction.purpose(value: Throw(userOne, 2000.00))
        
        let userTwo = User(name: "User Two")
        auction.purpose(value: Throw(userTwo, 3000.00))
        
        XCTAssertEqual(2, auction.throwsOfAuction?.count)
        XCTAssertEqual(2000.00, auction.throwsOfAuction?.first?.value)
        XCTAssertEqual(3000.00, auction.throwsOfAuction?[1].value)
    }
    
    func testMustIgnoreTwoBidsConsecutiveFromSameUser() {
        let auction = Auction(description: "Some samsung phone")
        XCTAssertEqual(0, auction.throwsOfAuction?.count)
        
        let userOne = User(name: "User One")
        auction.purpose(value: Throw(userOne, 2000.00))
        auction.purpose(value: Throw(userOne, 3000.00))
        
        XCTAssertEqual(1, auction.throwsOfAuction?.count)
        XCTAssertEqual(2000.0, auction.throwsOfAuction?.first?.value)
    }

}
