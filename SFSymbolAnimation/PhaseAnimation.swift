//
//  PhaseAnimation.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

struct AnimateProperties: Equatable{
    let color: Color
    let bgColor: Color
    let font: Font
    let fontWeight: Font.Weight
    let cornerRadius: CGFloat
    let xScale: CGFloat
    let yScale: CGFloat
    let offsetY: CGFloat
    let rotate: CGFloat
}

struct PhaseAnimation: View {
    @State private var animateMe = false
    let phases: [AnimateProperties] = [
        .init(
            color: .red,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .semibold,
            cornerRadius: 20,
            xScale: 1.0,
            yScale: 1.5,
            offsetY: 0,
            rotate: 30
        ),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 0,
            xScale: 1.5,
            yScale: 1.0,
            offsetY: 50,
            rotate: 60
        ),
        .init(
            color: .purple,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .bold,
            cornerRadius: 50,
            xScale: 1.0,
            yScale: 1.0,
            offsetY: -20,
            rotate: 0
        )
    ]
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("Hello World!")
                .phaseAnimator(phases, trigger: animateMe, content: { view, phase in
                    view
                        .font(phase.font)
                        .fontWeight(phase.fontWeight)
                        .foregroundStyle(phase.color)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: phase.cornerRadius)
                                .fill(phase.bgColor)
                        )
                        .scaleEffect(x: phase.xScale, y: phase.yScale)
                        .offset(y: phase.offsetY)
                        .rotation3DEffect(
                            Angle(degrees: phase.rotate),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                })

            
            Spacer()
            
            Button(action: {
                animateMe.toggle()
            }, label: {
                Text(animateMe ? "Stop" : "Play")
            })
        }
    }
}

#Preview {
    PhaseAnimation()
}
