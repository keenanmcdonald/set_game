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
        VStack{
            Group{
                CardView(card: model.deck[0])
                CardView(card: model.deck[1])
                CardView(card: model.deck[2])
                CardView(card: model.deck[3])
                CardView(card: model.deck[4])
                CardView(card: model.deck[5])
                CardView(card: model.deck[6])
            }
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            HStack{
                ForEach(0..<card.number){_ in
                    if (self.card.shape == SetGame.Shape.rectangle){
                        Rectangle().fill(self.card.color).aspectRatio(0.5, contentMode: ContentMode.fit)
                    }
                    else if (self.card.shape == SetGame.Shape.oval){
                        Capsule().fill(self.card.color).aspectRatio(0.5, contentMode: ContentMode.fit)
                    }
                    else{
                        
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
