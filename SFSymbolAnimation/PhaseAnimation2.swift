//
//  PhaseAnimation2.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

struct PhaseAnimation2: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow,.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.3)
                .ignoresSafeArea()
            
            Image("fruit")
                .resizable()
                .scaledToFit()
                .phaseAnimator([0,10,15,3]) { view, phase in
                    view
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: phase)
                        }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        }
    }
}

#Preview {
    PhaseAnimation2()
}
