//
//  Auction.swift
//  Auction App
//
//  Created by Rodrigo Conte on 23/02/21.
//

import Foundation

class Auction {
    
    let description: String
    let imagem: String?
    var throwsOfAuction: [Throw]?
    
    init(description: String, image:String? = nil, throwsOfAuction: [Throw] = []) {
        self.description = description
        self.imagem = image
        self.throwsOfAuction = throwsOfAuction
    }
    
    func purpose(value throwsParam: Throw) {
        guard let listOfBids = throwsOfAuction else { return }
        
        if listOfBids.count == 0 || canGiveBid(throwsParam.user, listOfBids) {
            throwsOfAuction?.append(throwsParam)
        }
    }
    
    private func canGiveBid(_ user: User, _ listOfBids: [Throw]) -> Bool{
        return lastBid(listOfBids).user != user && quantityOfBidsFromSameUser(user) < 5
    }
    
    private func lastBid(_ listOfBids: [Throw]) -> Throw {
        return listOfBids[listOfBids.count - 1]
    }
    
    private func quantityOfBidsFromSameUser(_ user: User) -> Int {
        guard let listOfBids = throwsOfAuction else { return 0 }
        var total = 0
        for bid in listOfBids {
            if bid.user == user {
                total += 1
            }
        }
        return total
    }
    
    
}
