//
//  SetModel.swift
//  set_game
//
//  Created by Keenan McDonald on 8/11/20.
//  Copyright © 2020 Keenan McDonald. All rights reserved.
//

import SwiftUI

struct SetGame{
    private(set) var deck: Array<Card>
    private(set) var matched: Array<Card> = []
    var score = 0
        
    func doesMatch(cards: Array<Card>) -> Bool {
        for trait in 0..<4{
            if !((cards[0].traits[trait] == cards[1].traits[trait]
                    && cards[0].traits[trait] == cards[1].traits[trait])
                || (cards[0].traits[trait] != cards[1].traits[trait]
                    && cards[0].traits[trait] != cards[2].traits[trait]
                    && cards[1].traits[trait] != cards[2].traits[trait])) {
                return false
            }
        }
        return true
    }
    
    init(){
        func generateDeck() -> Array<Card>{
            var cards = Array<Card>()
            
            for index in 1...81{
                cards.append(Card(index: index))
            }
            
            return cards
        }
        
        deck = generateDeck()
    }

    
    struct Card : Identifiable {
        var isSelected: Bool = false
        var id: Int
        var traits: Array<Int> = []
        
        init(index: Int){
            self.id = index
            var value = index
            for _ in 0..<4 {
                self.traits.append(value % 3)
                value = value / 3
            }
        }
    }
}
