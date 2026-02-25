//
//  MainView.swift
//  HealthyCampus-Demo
//
//  Created by Admin on 2/10/26.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0
    @State private var isShowingStressorLog = false
    let menuItems: [String] = ["Home", "Browse", "Search", "Profile", "Settings", "Notifications"]
    
    var body: some View {
        NavigationStack{
            /*VStack{
             HStack{
             Text("Hello, World!")
             .onAppear(){
             print("MainView Showing")
             }
             .padding()
             ZStack{
             Rectangle()
             .fill(Color.orange)
             .frame(width:200, height: 100)
             NavigationLink("Click Here to View Your Stressors", destination: StressorLogView())
             }
             /*Button("Click Here to View Your Stressors", systemImage: "pencil") {
              print("Edit button was tapped")
              
              }*/
             
             }
             }
             }*/
            
            ScrollView(.horizontal, showsIndicators: false) {
                /*LazyHStack(spacing: 20) {
                 ForEach(menuItems.indices, id: \.self) { index in
                 Button(action: {
                 selectedIndex = index
                 }) {
                 Text(menuItems[index])
                 .padding(.vertical, 10)
                 .padding(.horizontal, 15)
                 .foregroundColor(selectedIndex == index ? .white : .primary)
                 .background(selectedIndex == index ? Color.blue : Color.secondary.opacity(0.2))
                 .cornerRadius(200)
                 .clipShape(Circle())
                 //.frame(width: 80, height: 75)
                 }
                 .contentShape(Circle())
                 //.frame(width:90, height:90)
                 }
                 }
                 .padding(.horizontal)*/
                
                HStack{
                    
                    Button(action: {
                        print("1st Button tapped!")
                    }) {
                        Image(systemName: "play.fill") // Use an SF Symbol
                        //Text("Sample Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // Set a specific size
                            .padding(20) // Add padding around the image
                            .foregroundColor(.white)
                        //.background(Color.indigo) // Add a background color
                            .clipShape(Circle()) // Clip the entire button to a circle
                    }
                    
                    Button(action: {
                        print("2nd Button tapped!")
                    }) {
                        Image(systemName: "play.fill") // Use an SF Symbol
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // Set a specific size
                            .padding(20) // Add padding around the image
                            .foregroundColor(.white)
                        //.background(Color.blue) // Add a background color
                            .clipShape(Circle()) // Clip the entire button to a circle
                    }
                    NavigationLink(destination: StressorLogView(), isActive: $isShowingStressorLog){
                        
                        Button(action: {
                            isShowingStressorLog = true
                            //print("3rd Button tapped!")
                        }) {
                            Image(systemName: "play.fill") // Use an SF Symbol
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40) // Set a specific size
                                .padding(20) // Add padding around the image
                                .foregroundColor(.white)
                            //.background(Color.blue) // Add a background color
                                .clipShape(Circle()) // Clip the entire button to a circle
                        }
                        
                    }
                    
                    Button(action: {
                        print("4th Button tapped!")
                    }) {
                        Image(systemName: "play.fill") // Use an SF Symbol
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // Set a specific size
                            .padding(20) // Add padding around the image
                            .foregroundColor(.white)
                        //.background(Color.blue) // Add a background color
                            .clipShape(Circle()) // Clip the entire button to a circle
                    }
                    
                    Button(action: {
                        print("5th Button tapped!")
                    }) {
                        Image(systemName: "play.fill") // Use an SF Symbol
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // Set a specific size
                            .padding(20) // Add padding around the image
                            .foregroundColor(.white)
                        //.background(Color.blue) // Add a background color
                            .clipShape(Circle()) // Clip the entire button to a circle
                    }
                    
                    
                    
                }
                
            }
            .frame(height: 100) // Constrain the height of the scroll view
            .background(Color(red: 242/255.0, green: 237/255.0, blue: 245/255.0))
            .position(x:200, y:725)
            
            
        }
    }
    
}


struct MainView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
        
    }
}

/*#Preview {
    MainView()
}*/
