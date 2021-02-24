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
        throwsOfAuction?.append(throwsParam)
    }
    
}