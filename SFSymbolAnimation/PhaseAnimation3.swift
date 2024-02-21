//
//  PhaseAnimation3.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

enum Phase: CaseIterable{
    case start, middle, end
}

struct PhaseAnimation3: View {
    @State private var animateMe = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, World!")
                .phaseAnimator(Phase.allCases, trigger: animateMe) { view, phase in
                    view
                        .font(phase == .middle ? .subheadline : .largeTitle)
                        .blur(radius: phase == .end ? 10 : 0)
                        .foregroundStyle(phase == .middle ? .red : .blue)
            }
            
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
    PhaseAnimation3()
}
