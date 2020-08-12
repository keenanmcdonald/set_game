//
//  DiamondView.swift
//  set_game
//
//  Created by Keenan McDonald on 8/11/20.
//  Copyright © 2020 Keenan McDonald. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.width
        let height = rect.height
        let start = CGPoint(x: center.x, y: center.y+height/2)
        
        var p = Path()
        p.move(to: start)
        p.addLine(to: CGPoint(x: center.x + width/2, y: center.y))
        p.addLine(to: CGPoint(x: center.x, y: center.y - height/2))
        p.addLine(to: CGPoint(x: center.x - width/2, y: center.y))
        p.addLine(to: start)
        
        return p
    }
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
