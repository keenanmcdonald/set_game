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
        if ((cards[0].color == cards[1].color && cards[0].color == cards[1].color) || (cards[0].color != cards[1].color && cards[0].color != cards[2].color && cards[1].color != cards[2].color)){
            if ((cards[0].number == cards[1].number && cards[0].number == cards[1].number) || (cards[0].number != cards[1].number && cards[0].number != cards[2].number && cards[1].number != cards[2].number)){
                if ((cards[0].shading == cards[1].shading && cards[0].shading == cards[1].shading) || (cards[0].shading != cards[1].shading && cards[0].shading != cards[2].shading && cards[1].shading != cards[2].shading)){
                    if ((cards[0].shape == cards[1].shape && cards[0].shape == cards[1].shape) || (cards[0].shape != cards[1].shape && cards[0].shape != cards[2].shape && cards[1].shape != cards[2].shape)){
                        return true
                    }
                }
            }
        }
        return false
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

    
    struct Card{
        var isSelected: Bool = false
        var number: Int
        var color: Color
        var shading: Shade
        var shape: Shape
        var colors: Array<Color> = [Color.red, Color.green, Color.blue]
        
        init(index: Int){
            
            self.number = (index % 3)+1
            var val = index / 3
            self.color = colors[val % 3]
            val = index / 3
            self.shading = Shade(rawValue: val % 3) ?? Shade.none
            val = index / 3
            self.shape = Shape(rawValue: val % 3) ?? Shape.rectangle
        }
    }
    
    
    enum Shade: Int{
        case none, light, dark
    }
    enum Shape: Int{
        case rectangle, oval, diamond
    }
    
}



struct SetModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
