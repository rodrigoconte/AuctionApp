//
//  EvaluatorTests.swift
//  Auction AppTests
//
//  Created by Rodrigo Conte on 23/02/21.
//

import XCTest

@testable import Auction_App

class EvaluatorTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testCouldUnderstandThrowsInGrowingOrder() {
        
        let user1 = User(id: 1, name: "User One")
        let user2 = User(id: 2, name: "User Two")
        let user3 = User(id: 3, name: "User Three")
        
        let auction = Auction(description: "Playstation 5")
        auction.purpose(value: Throw(user1, 250.00))
        auction.purpose(value: Throw(user2, 300.00))
        auction.purpose(value: Throw(user3, 400.00))
        
        let auctioner = Evaluator()
        auctioner.evaluate(auction: auction)
        
        let bigger = 400.00
        let smaller = 250.00
        
        XCTAssertEqual(smaller, auctioner.leastThrow())
        XCTAssertEqual(bigger, auctioner.greaterThrow())
        
    }
    
    func testCouldUndestandAuctionWithJustOneThrow() {
        
        let user1 = User(id: 1, name: "User 1")
        let auction = Auction(description: "Playstation 5")
        auction.purpose(value: Throw(user1, 550.00))
        
        let auctioner = Evaluator()
        auctioner.evaluate(auction: auction)
        
        XCTAssertEqual(auctioner.greaterThrow(), auctioner.leastThrow())
        
    }

}
