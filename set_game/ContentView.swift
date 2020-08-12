//
//  ContentView.swift
//  set_game
//
//  Created by Keenan McDonald on 8/11/20.
//  Copyright © 2020 Keenan McDonald. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var model = SetGame()

    var body: some View {
        Grid(model.deck) { card in
            CardView(card: card)
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    //move these somewhere else!!
    var colors = [Color.red, Color.green, Color.blue]

    var number: Int
    var color: Color
    var opacity: Double
    var shape: cardShape?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 1.0).padding(1.0)
            HStack{
                
                if (self.shape == cardShape.rectangle){
                    ForEach(0..<self.number, id: \.self){_ in
                        ZStack{
                            Rectangle().stroke(self.color)
                            Rectangle().fill(self.color).opacity(self.opacity)
                        }.aspectRatio(0.5, contentMode: ContentMode.fit)
                    }
                }
                else if (self.shape == cardShape.oval){
                    ForEach(0..<self.number, id: \.self){_ in
                        ZStack{
                            Capsule().stroke(self.color)
                            Capsule().fill(self.color).opacity(self.opacity)
                        }.aspectRatio(0.5, contentMode: ContentMode.fit)
                    }
                }
                else {
                    ForEach(0..<self.number, id: \.self){_ in
                        ZStack{
                            Diamond().stroke(self.color)
                            Diamond().fill(self.color).opacity(self.opacity)
                        }.aspectRatio(0.5, contentMode: ContentMode.fit)
                    }
                }
            }.padding(8.0)
        }.aspectRatio(1.8, contentMode: ContentMode.fit)
    }
    
    init(card: SetGame.Card){
        self.card = card
        number = card.traits[0]+1
        color = colors[card.traits[1]]
        opacity = Double(card.traits[2]) * 0.5
        shape = cardShape(rawValue: card.traits[3])
    }
}

enum cardShape: Int {
    case rectangle, diamond, oval
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
