//
//  PanelView.swift
//  TrafficLightsSwiftUI
//
//  Created by Михаил Иванов on 26.10.2021.
//

import SwiftUI

struct PanelView: View {
    var lightSwitchRed: Double
    var lightSwitchYellow: Double
    var lightSwitchGreen: Double
    
    var body: some View {
        VStack {
            CircleLight(color: .red, lightSwitch: lightSwitchRed)
            CircleLight(color: .yellow, lightSwitch: lightSwitchYellow)
            CircleLight(color: .green, lightSwitch: lightSwitchGreen)
        }
    }
}

private struct CircleLight: View {
    var color: Color
    var lightSwitch: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .brightness(lightSwitch)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
    }
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView(lightSwitchRed: 0.4, lightSwitchYellow: 0.4, lightSwitchGreen: 0.0)
    }
}
