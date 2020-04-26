//
//  ContentView.swift
//  neumorphicButtons
//
//  Created by Abraham Calvillo on 4/25/20.
//  Copyright © 2020 AbrahamCalvillo. All rights reserved.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    @State private var isToggled = false
    var body: some View {
        
        ZStack{
            LinearGradient(Color.darkStart, Color.darkEnd )
            
            
            VStack(spacing: 20){
                Toggle(isOn: $isToggled) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                        .opacity(0)
                }
                .toggleStyle(ButtonToggleStyle())
                
                
                ZStack{
                    Circle()
                        .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                        .frame(width: 15, height: 15)
                        .blur(radius: 2.0)
                    
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(isToggled ? Color.green : Color.gray.opacity(0.5))
                        .animation(Animation.easeIn(duration: 0.3))
                    
                    
                }
                .frame(width: 15, height: 15)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct ButtonBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                    .blur(radius: 4)
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                
                
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
                    .blur(radius: 3)
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
                
            }
        }
    }
}


struct ButtonToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        Button(action: {
            configuration.isOn.toggle()
            let impactLight = UIImpactFeedbackGenerator(style: .light)
            impactLight.impactOccurred()
        }) {
            configuration.label
                .frame(width: 90, height: 90)
                .contentShape(RoundedRectangle(cornerRadius: 45))
        }
        .background(
            ButtonBackground(isHighlighted: configuration.isOn, shape: RoundedRectangle(cornerRadius: 45))
        )
        .animation(Animation.easeOut.speed(2.5))
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
