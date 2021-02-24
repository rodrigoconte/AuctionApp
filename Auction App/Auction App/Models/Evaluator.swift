//
//  Evaluator.swift
//  Auction App
//
//  Created by Rodrigo Conte on 23/02/21.
//

import Foundation

class Evaluator {
    
    private var greaterOfAll = Double.leastNonzeroMagnitude
    private var leasterOfAll = Double.greatestFiniteMagnitude
    
    func evaluate(auction: Auction) {
        guard let allThrows = auction.throwsOfAuction else { return }
        
        for currentThrow in allThrows {
            if currentThrow.value > greaterOfAll {
                greaterOfAll = currentThrow.value
            }
            if currentThrow.value < leasterOfAll {
                leasterOfAll = currentThrow.value
            }
        }
    }
    
    func greaterThrow() -> Double {
        return greaterOfAll
    }
    
    func leastThrow() -> Double {
        return leasterOfAll
    }
    
}
