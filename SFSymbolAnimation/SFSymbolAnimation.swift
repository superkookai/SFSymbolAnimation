//
//  SFSymbolAnimation.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

struct SFSymbolAnimation: View {
    @State private var clicked = false
    @State private var pauseGlobe = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.bounce, value: clicked)
                    .padding()
                
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .symbolEffect(.pulse, value: clicked)
                    .padding()
                
                Image(systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.iterative, value: clicked)
                    .foregroundStyle(clicked ? .red : .black)
                    .padding()
                
                Image(systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.cumulative, value: clicked)
                    .foregroundStyle(clicked ? .blue : .black)
                    .padding()
                
                Image(systemName: clicked ? "eye" : "eye.slash")
                    .imageScale(.large)
                    .symbolEffect(.bounce, value: clicked)
                    .foregroundStyle(clicked ? .black : .gray.opacity(0.5))
                    .padding()
                
                Image(systemName: clicked ? "person.crop.circle.badge.plus" : "bolt.horizontal.circle.fill")
                    .imageScale(.large)
                    .symbolEffect(.pulse.wholeSymbol, options: .repeat(3).speed(3), value: clicked)
                    .foregroundStyle(clicked ? .blue : .purple.opacity(0.5))
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
        }
    }
}

#Preview {
    SFSymbolAnimation()
}
