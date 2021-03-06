//
//  EvaluatorTests.swift
//  Auction AppTests
//
//  Created by Rodrigo Conte on 23/02/21.
//

import XCTest

@testable import Auction_App

class EvaluatorTests: XCTestCase {
    
    private var userOne: User!
    private var userTwo: User!
    private var userThree: User!
    private var auctioner: Evaluator!
    
    override func setUp() {
        super.setUp()
        initUsers()
        initEvaluator()
    }
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testCouldUnderstandThrowsInGrowingOrder() {
        
        let auction = AuctionCreator()
            .to(description: "Playstation 5")
            .bid(userOne, 250.00)
            .bid(userTwo, 300.00)
            .bid(userThree, 400.00)
            .construct()
        
        try? auctioner.evaluate(auction: auction)
        
        let bigger = 400.00
        let smaller = 250.00
        
        XCTAssertEqual(smaller, auctioner.leastThrow())
        XCTAssertEqual(bigger, auctioner.greaterThrow())
    }
    
    func testCouldUndestandAuctionWithJustOneThrow() {
        let auction = Auction(description: "Playstation 5")
        auction.purpose(value: Throw(userOne, 550.00))
        
        try? auctioner.evaluate(auction: auction)
        
        XCTAssertEqual(auctioner.greaterThrow(), auctioner.leastThrow())
        
    }
    
    func testCouldFindThreeBiggestThrows() {
        let auction = Auction(description: "Playstation 5")
        auction.purpose(value: Throw(userOne, 250.00))
        auction.purpose(value: Throw(userTwo, 300.00))
        auction.purpose(value: Throw(userThree, 400.00))
        auction.purpose(value: Throw(userOne, 600.00))
        
        try? auctioner.evaluate(auction: auction)
        
        let throwsList = auctioner.threeBiggest()
        
        XCTAssertEqual(3, throwsList.count)
        XCTAssertEqual(600, throwsList[0].value)
        XCTAssertEqual(400, throwsList[1].value)
        XCTAssertEqual(300, throwsList[2].value)
        
    }
    
    func testMustIgnoreAuctionWithoutBids() {
        let auction = AuctionCreator().to(description: "Mega Drive").construct()
        
        XCTAssertThrowsError(try auctioner.evaluate(auction: auction), "Is not possible evaluate auctions without bids.") { (err) in
            print(err.localizedDescription)
        }
    }
    
    private func initUsers(){
        userOne = User(id: 1, name: "User One")
        userTwo = User(id: 2, name: "User Two")
        userThree = User(id: 3, name: "User Three")
    }
    
    private func initEvaluator() {
        auctioner = Evaluator()
    }
    
}
