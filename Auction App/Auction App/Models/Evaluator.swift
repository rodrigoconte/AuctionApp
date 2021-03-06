//
//  Evaluator.swift
//  Auction App
//
//  Created by Rodrigo Conte on 23/02/21.
//

import Foundation

enum ErrorEvaluator: Error {
    case auctionWithoutBids(String)
}

class Evaluator {
    
    private var greaterOfAll = Double.leastNonzeroMagnitude
    private var leasterOfAll = Double.greatestFiniteMagnitude
    private var biggests: [Throw] = []
    
    func evaluate(auction: Auction) throws {
        
        if auction.throwsOfAuction?.count == 0 {
            throw ErrorEvaluator.auctionWithoutBids("Was not possible evaluate an auction without bids.")
        }
        
        guard let allThrows = auction.throwsOfAuction else { return }
        
        for currentThrow in allThrows {
            if currentThrow.value > greaterOfAll {
                greaterOfAll = currentThrow.value
            }
            if currentThrow.value < leasterOfAll {
                leasterOfAll = currentThrow.value
            }
        }
        
        getBiggerThrowsOnAuction(auction)
    }
    
    func greaterThrow() -> Double {
        return greaterOfAll
    }
    
    func leastThrow() -> Double {
        return leasterOfAll
    }
    
    func threeBiggest() -> [Throw] {
        return biggests
    }
    
    private func getBiggerThrowsOnAuction(_ auction: Auction) {
        guard let allThrows = auction.throwsOfAuction else { return }
        
        biggests = allThrows.sorted(by: { (list1, list2) -> Bool in
            return list1.value > list2.value
        })
        
        let biggestThrows = biggests.prefix(3)
        biggests = Array(biggestThrows)
    }
    
}
