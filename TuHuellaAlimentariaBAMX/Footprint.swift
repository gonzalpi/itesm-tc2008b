//
//  Footprint.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI

struct Footprint: View {
    let footprint: String
    let bg: Color,
        fg: Color
    init(footprint: String, bg: Color, fg: Color) {
        self.footprint = footprint
        self.bg = bg
        self.fg = fg
    }
    var body: some View {
        VStack {
            Spacer()
            Text("Tu huella alimentaria es")
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width - 50)
            ZStack {
                Image("footprint_bg")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(fg)
                    .frame(width: UIScreen.main.bounds.width)
                VStack {
                    Text(footprint)
                        .italic()
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .padding(.top, 30)
                    Text("de comida al año")
                        .italic()
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .regular, design: .default))
                }
            }
            Spacer()
            FooterButton()
                .padding(.bottom, -80)
        }
        .background(bg)
    }
}

struct Footprint_Previews: PreviewProvider {
    static var previews: some View {
        Footprint(
            footprint: "8000 kg",
            bg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1))
        )
    }
}
