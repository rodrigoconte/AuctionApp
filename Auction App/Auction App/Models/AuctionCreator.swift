//
//  AuctionCreator.swift
//  Auction App
//
//  Created by Rodrigo Conte on 06/03/21.
//

import UIKit

class AuctionCreator: NSObject {
    
    private var auction: Auction!
    
    func to(description: String) -> Self {
        auction = Auction(description: description)
        return self
    }
    
    func bid(_ user: User, _ value: Double) -> Self{
        auction.purpose(value: Throw(user, value))
        return self
    }
    
    func construct() -> Auction {
        return auction
    }
}
