//
//  MainView.swift
//  HealthyCampus-Demo
//
//  Created by Admin on 2/10/26.
//

import SwiftUI

struct MainView: View {
    @State private var showComingSoon = false
    @State private var featureName = ""
    
    // External Links (Deep Links)
    let chatGPTURL = URL(string: "https://chat.openai.com")!
    let spotifyURL = URL(string: "spotify://")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 1.0).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // 1. HEADER ("Bulldogs 🌙")
                        headerSection
                        
                        // 2. SLEEP SCHEDULE CARD
                        sleepScheduleCard
                            .onTapGesture { triggerAlert("Sleep Schedule") }
                        
                        // 3. WELLNESS SPACES (Clickable circles)
                        wellnessSpacesSection
                        
                        // 4. AI COMPANION (Opens ChatGPT)
                        aiCompanionSection
                        
                        // 5. WEEKLY SUMMARY CHART
                        VStack(alignment: .leading, spacing: 15) {
                            Text("WEEKLY SUMMARY")
                                .font(.caption.bold())
                                .foregroundColor(.gray)
                                .tracking(1)
                            
                            stressSummaryChart
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.bottom, 120)
                }
                
                // TAB BAR
                bottomTabBar
            }
            .alert("Coming Soon", isPresented: $showComingSoon) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("\(featureName) is being prepared for your demo!")
            }
        }
    }
    
    // MARK: - WELLNESS SECTION (The Active Buttons)
    private var wellnessSpacesSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("WELLNESS SPACES").font(.caption.bold()).foregroundColor(.gray).tracking(1)
            
            HStack(spacing: 20) {
                // SLEEP (Alert)
                Button(action: { triggerAlert("Sleep Lab") }) {
                    WellnessCircle(icon: "moon.fill", label: "Sleep 😴", color: .yellow)
                }
                .buttonStyle(PlainButtonStyle())
                
                // BREATHE (Goes to BreatheView)
                NavigationLink(destination: BreatheView()) {
                    WellnessCircle(icon: "figure.mindful.move", label: "Breathe 🧘‍♂️", color: .orange)
                }
                .buttonStyle(PlainButtonStyle())
                
                // EXERCISE (Alert)
                Button(action: { triggerAlert("Quick Workout") }) {
                    WellnessCircle(icon: "figure.run", label: "Exercise 🏃‍♀️", color: .blue)
                }
                .buttonStyle(PlainButtonStyle())
                
                // JOURNAL (Goes to StressorLogView)
                NavigationLink(destination: StressorLogView()) {
                    WellnessCircle(icon: "book.closed.fill", label: "Journal ✍️", color: .purple)
                }
                .buttonStyle(PlainButtonStyle())
                
                // SOUNDS (Opens Spotify)
                Button(action: { openLink(spotifyURL) }) {
                    WellnessCircle(icon: "music.note", label: "Sounds 🎵", color: .pink)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
    }

    // MARK: - REMAINING UI COMPONENTS (Header, AI, Chart)
    
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Good evening,").font(.system(size: 18)).foregroundColor(.gray)
                HStack(spacing: 5) {
                    Text("Bulldog").font(.system(size: 32, weight: .bold)).foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.4))
                    Text("🌙").font(.title)
                }
            }
            Spacer()
            Image(systemName: "iris") // Fixed flower icon error
                .foregroundColor(.white)
                .padding(12)
                .background(Circle().fill(Color.pink.opacity(0.4)))
        }
        .padding(.horizontal).padding(.top, 20)
    }

    private var sleepScheduleCard: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("SLEEP SCHEDULE").font(.caption.bold()).foregroundColor(.gray)
            HStack {
                VStack(alignment: .leading) { Text("10:30 PM").font(.title2.bold()); Text("BEDTIME").font(.caption2).foregroundColor(.gray) }
                Spacer(); Image(systemName: "arrow.right").foregroundColor(.gray); Spacer()
                VStack(alignment: .trailing) { Text("6:30 AM").font(.title2.bold()); Text("WAKE UP").font(.caption2).foregroundColor(.gray) }
            }
            Text("● 8h target - on track").font(.caption).foregroundColor(.green).padding(.horizontal, 10).padding(.vertical, 4).background(Capsule().fill(Color.green.opacity(0.1)))
        }
        .padding().background(Color.white).cornerRadius(20).padding(.horizontal).shadow(color: .black.opacity(0.02), radius: 10)
    }

    private var aiCompanionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("AI COMPANION").font(.caption.bold()).foregroundColor(.gray).tracking(1)
            Button(action: { openLink(chatGPTURL) }) {
                HStack(spacing: 15) {
                    ZStack { Circle().stroke(Color.purple.opacity(0.2), lineWidth: 1).frame(width: 50, height: 50); Image(systemName: "globe").foregroundColor(.purple) }
                    VStack(alignment: .leading) { Text("Chat with AI Companion").font(.headline); Text("Powered by ChatGPT").font(.subheadline).foregroundColor(.gray) }
                    Spacer(); Circle().fill(Color.green).frame(width: 8, height: 8); Text("Online").font(.caption).foregroundColor(.gray)
                }
                .padding().background(Color.white).cornerRadius(20).shadow(color: .black.opacity(0.02), radius: 10)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal)
    }

    private var stressSummaryChart: some View {
        HStack(alignment: .bottom, spacing: 15) {
            ForEach(0..<7) { index in
                VStack {
                    RoundedRectangle(cornerRadius: 5).fill(index == 2 ? Color.orange : Color.teal.opacity(0.5))
                        .frame(width: 25, height: CGFloat.random(in: 30...80))
                    Text(["M","T","W","T","F","S","S"][index]).font(.caption2).foregroundColor(.secondary)
                }
            }
        }
        .padding().frame(maxWidth: .infinity).background(Color.white).cornerRadius(20).shadow(color: .black.opacity(0.02), radius: 10)
    }

    private var bottomTabBar: some View {
        VStack {
            Spacer()
            HStack(spacing: 35) {
                TabItem(icon: "house.fill", label: "Home", isSelected: true)
                TabItem(icon: "leaf.fill", label: "Calm", isSelected: false)
                TabItem(icon: "person.2.fill", label: "Connect", isSelected: false)
                TabItem(icon: "sparkles", label: "AI", isSelected: false).onTapGesture { openLink(chatGPTURL) }
            }
            .padding(.vertical, 15).frame(maxWidth: .infinity).background(Color.white.shadow(color: .black.opacity(0.02), radius: 10, y: -5).ignoresSafeArea())
        }
    }

    func triggerAlert(_ name: String) { featureName = name; showComingSoon = true }
    func openLink(_ url: URL) { if UIApplication.shared.canOpenURL(url) { UIApplication.shared.open(url) } }
}

// HELPER COMPONENTS
struct WellnessCircle: View {
    let icon: String; let label: String; let color: Color
    var body: some View {
        VStack {
            ZStack { Circle().fill(color.opacity(0.15)).frame(width: 55, height: 55); Image(systemName: icon).foregroundColor(color) }
            Text(label).font(.system(size: 10)).foregroundColor(.gray)
        }
    }
}

struct TabItem: View {
    let icon: String; let label: String; let isSelected: Bool
    var body: some View {
        VStack(spacing: 4) { Image(systemName: icon).font(.system(size: 20)); Text(label).font(.system(size: 10)) }
        .foregroundColor(isSelected ? .purple : .gray)
    }
}
