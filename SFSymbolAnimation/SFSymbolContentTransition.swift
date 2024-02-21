//
//  SFSymbolContentTransition.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

struct SFSymbolContentTransition: View {
    @State private var clicked = false
    @State private var pauseGlobe = false
    @State private var runCount = 1
    @State private var layerAnimate = true
    @State private var animationRunning = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.bounce, value: clicked)
                    .contentTransition(
                        .symbolEffect(.replace.byLayer.downUp)
                    )
                    .padding()
                
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.pulse.wholeSymbol, value: clicked)
                    .contentTransition(
                        .symbolEffect(.replace.wholeSymbol.upUp)
                    )
                    .padding()
            }
            
            
            HStack {
                Button(action: {
                    clicked.toggle()
                }, label: {
                    Text("Click Me")
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black.opacity(0.7))
                        )
                    
                })
                
                Button(action: {
                    pauseGlobe.toggle()
                }, label: {
                    Text(pauseGlobe ? "Unpause Globe" : "Pause Globe")
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black.opacity(0.7))
                        )
                    
                })
            }
            
            Button(action: {
                runCount += 1
            }, label: {
                Label("Hello World: \(runCount)", systemImage: "figure.run.circle")
            })
            .symbolEffect(layerAnimate ? .bounce.byLayer : .bounce.wholeSymbol, options: .repeat(runCount), value: runCount)
            .font(.title)
            .padding()
            
            Button(action: {
                layerAnimate.toggle()
            }, label: {
                Text(layerAnimate ? "Whole Animate" : "Layer Animate")
            })
        }
    }
}

#Preview {
    SFSymbolContentTransition()
}
