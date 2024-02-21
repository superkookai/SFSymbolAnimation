//
//  KeyFrameAnimation.swift
//  SFSymbolAnimation
//
//  Created by Weerawut Chaiyasomboon on 21/2/2567 BE.
//

import SwiftUI

struct AnimationValues{
    var offsetY: CGFloat = -300
    var rotation: Angle = Angle(degrees: 0)
    var scaleX = 1.0
}

struct KeyFrameAnimation: View {
    let timeDuration: Double
    
    var body: some View {
        MyShape()
            .keyframeAnimator(initialValue: AnimationValues()) { view, value in
                view
                    .rotationEffect(value.rotation)
                    .offset(y: value.offsetY)
                    .scaleEffect(x: value.scaleX)
            } keyframes: { value in
                KeyframeTrack(\.offsetY) {
                    LinearKeyframe(-300, duration: timeDuration * 0.2)
                    SpringKeyframe(0, duration: timeDuration * 0.7)
                    LinearKeyframe(-100, duration: timeDuration * 0.1)
                }
                
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(.zero, duration: timeDuration * 0.5)
                    CubicKeyframe(Angle(degrees: 20*360), duration: timeDuration * 0.5)
                }
                
                KeyframeTrack(\.scaleX) {
                    SpringKeyframe(1, duration: timeDuration * 0.25)
                    SpringKeyframe(0.1, duration: timeDuration * 0.5)
                    SpringKeyframe(0.8, duration: timeDuration * 0.25)
                }
            }

    }
}

struct MyShape: View {
    var body: some View {
        Circle()
            .stroke(
                AngularGradient(colors: [.red, .green, .blue, .yellow, .black, .indigo, .pink], center: .center), lineWidth: 20
            )
            .shadow(radius: 3)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    KeyFrameAnimation(timeDuration: 5)
}
