//
//  Extensions.swift
//  neumorphicButtons
//
//  Created by Abraham Calvillo on 4/26/20.
//  Copyright © 2020 AbrahamCalvillo. All rights reserved.
//

import SwiftUI


extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
   
    static let lightStart = Color(red: 240/255, green: 240/255, blue: 246/255)
    static let lightEnd = Color(red: 120/255, green: 120/255, blue: 123/255)
    
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
