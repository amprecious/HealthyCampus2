//
//  MainView.swift
//  HealthyCampus-Demo
//
//  Created by Admin on 2/10/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background Color for the whole screen
            Color(red: 0.95, green: 0.96, blue: 0.99)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    headerSection
                    sleepScheduleCard
                    wellnessSpacesSection
                    aiCompanionCard
                    stressorsSection
                }
                .padding(.bottom, 100) // Space for bottom nav
            }
            
            customBottomNavBar
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Good Morning,")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                HStack(spacing: 5) {
                    Text("Bulldog")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                    Text("🌙")
                        .font(.title)
                }
            }
            Spacer()
            Image(systemName: "flower.fill")
                .foregroundColor(.white)
                .padding(12)
                .background(Circle().fill(Color.pink.opacity(0.4)))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
    
    // MARK: - Sleep Schedule
    private var sleepScheduleCard: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("SLEEP SCHEDULE")
                .font(.caption)
                .tracking(1.5)
                .foregroundColor(.gray)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("10:30 PM")
                        .font(.system(size: 28, weight: .semibold))
                    Text("BEDTIME")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray.opacity(0.5))
                    .padding(.horizontal, 10)
                
                VStack(alignment: .leading) {
                    Text("6:30 AM")
                        .font(.system(size: 28, weight: .semibold))
                    Text("WAKE UP")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            Label("8h target · on track", systemImage: "circle.fill")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.green)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.green.opacity(0.1)))
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 30).fill(Color.white))
        .padding(.horizontal)
    }
    
    // MARK: - Wellness Spaces
    private var wellnessSpacesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("WELLNESS SPACES")
                .font(.caption)
                .tracking(1.5)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    WellnessButton(icon: "🌙", label: "Sleep", color: .blue)
                    WellnessButton(icon: "🧘", label: "Breathe", color: .green)
                    WellnessButton(icon: "🏃", label: "Exercise", color: .orange)
                    WellnessButton(icon: "📓", label: "Journal", color: .purple)
                    WellnessButton(icon: "🎵", label: "Sounds", color: .pink)
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - AI Companion
    private var aiCompanionCard: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("AI COMPANION")
                .font(.caption)
                .tracking(1.5)
                .foregroundColor(.gray)
            
            HStack(spacing: 15) {
                Circle()
                    .stroke(Color.purple.opacity(0.2), lineWidth: 4)
                    .frame(width: 50, height: 50)
                    .overlay(Image(systemName: "globe").foregroundColor(.blue))
                
                VStack(alignment: .leading) {
                    Text("Chat with Luna")
                        .font(.headline)
                    Text("Your private wellness companion")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: 4) {
                    Circle().fill(Color.green).frame(width: 6, height: 6)
                    Text("Online").font(.caption).foregroundColor(.gray)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.6)))
        }
        .padding(.horizontal)
    }

    private var stressorsSection: some View {
        Text("YOUR STRESSORS")
            .font(.caption)
            .tracking(1.5)
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
    
    // MARK: - Bottom Navigation
    private var customBottomNavBar: some View {
        HStack {
            NavIcon(icon: "house.fill", label: "Home", isSelected: true)
            Spacer()
            NavIcon(icon: "cloud.moon.fill", label: "Calm")
            Spacer()
            NavIcon(icon: "bubbles.and.sparkles.fill", label: "Connect")
            Spacer()
            NavIcon(icon: "globe", label: "Luna")
            Spacer()
            NavIcon(icon: "flower.fill", label: "Me")
        }
        .padding(.horizontal, 30)
        .padding(.top, 15)
        .padding(.bottom, 30)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 0)) // Standard bottom bar look
    }
}

// MARK: - Helper Components
struct WellnessButton: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(color.opacity(0.1))
                    .frame(width: 70, height: 70)
                Text(icon).font(.largeTitle)
            }
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct NavIcon: View {
    let icon: String
    let label: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .purple : .gray.opacity(0.6))
            Text(label)
                .font(.caption2)
                .foregroundColor(isSelected ? .black : .gray.opacity(0.6))
        }
    }
}

/*#Preview {
    MainView()
}*/
