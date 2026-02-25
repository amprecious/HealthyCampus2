//
//  StressorLogView.swift
//  HealthyCampus-Demo
//
//  Created by Admin on 2/15/26.
//

import SwiftUI

struct StressorLogView: View {
    var body: some View {
        Text("Welcome to the Stressor Log!")
            .onAppear{
                print("3rd Button tapped!")
            }
            //.navigationTitle("Stressors")
    }
        
}

#Preview {
    StressorLogView()
}
