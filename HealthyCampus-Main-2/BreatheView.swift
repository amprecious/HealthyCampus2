//
//  BreatheView.swift
//  HealthyCampus-Main-2
//
//  Created by Precious on 3/25/26.
//

import SwiftUI

struct BreatheView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isAnimating = false
    @State private var breatheText = "Inhale"
    @State private var timerCount = 0
    
    // Timer to sync the text with the 4-second breath cycle
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Background matching your "Precious" theme
            Color(red: 0.98, green: 0.98, blue: 1.0).ignoresSafeArea()
            
            VStack(spacing: 60) {
                // Header
                VStack(spacing: 12) {
                    Text("Breathe 🧘‍♂️")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                    
                    Text(breatheText)
                        .font(.title2.weight(.medium))
                        .foregroundColor(.purple)
                        .transition(.opacity)
                        .id(breatheText) // Forces a smooth transition when text changes
                }
                .padding(.top, 40)
                
                // THE BREATHING CIRCLE
                ZStack {
                    // Outer Pulse
                    Circle()
                        .fill(Color.orange.opacity(0.1))
                        .frame(width: isAnimating ? 320 : 140)
                    
                    // Middle Glow
                    Circle()
                        .fill(Color.orange.opacity(0.2))
                        .frame(width: isAnimating ? 260 : 100)
                    
                    // Main Breathing Circle
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.orange, .yellow.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: isAnimating ? 200 : 80)
                        .shadow(color: .orange.opacity(0.3), radius: 20)
                }
                
                Spacer()
                
                // Control Button
                Button(action: {
                    dismiss()
                }) {
                    Text("End Session")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Capsule().fill(Color.purple))
                        .padding(.horizontal, 50)
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            // Start the 4-second inhale/exhale loop
            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
        .onReceive(timer) { _ in
            // Toggle text every 4 seconds to match the circle
            withAnimation {
                breatheText = (breatheText == "Inhale") ? "Exhale" : "Inhale"
            }
        }
        .navigationBarBackButtonHidden(true) // Keeps the focus on the exercise
    }
}

#Preview {
    BreatheView()
}
