//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Михаил Иванов on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "Start"
    @State private var yellowLight = 0.4
    @State private var greenLight = 0.4
    @State private var redLight = 0.4
    @State private var currentLight = CurrentLight.reg
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                PanelView(lightSwitchRed: redLight, lightSwitchYellow: yellowLight, lightSwitchGreen: greenLight)
                Spacer()
                button
            }
            .padding()
        }
    }
    
    private var button: some View {
        Button {
            buttonText = "Next"
            
            switch currentLight {
            case .reg:
                greenLight = 0.4
                redLight = 0.0
                currentLight = .yellow
            case .yellow:
                redLight = 0.4
                yellowLight = 0.0
                currentLight = .green
            case .green:
                yellowLight = 0.4
                greenLight = 0.0
                currentLight = .reg
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 120, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 3))
                Text(buttonText)
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
    }
    
    enum CurrentLight {
        case reg, yellow, green
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
