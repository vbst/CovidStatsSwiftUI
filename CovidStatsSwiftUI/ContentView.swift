//
//  ContentView.swift
//  CovidStatsSwiftUI
//
//  Created by MacBro on 28.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    var body: some View {
        
        VStack {
            VStack(spacing: 18) {
                
                HStack {
                    
                    Text("Статистика COVID-19")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
      
//                    Button {
//
//                    } label: {
//                        Text("Россия")
//                            .foregroundColor(.white)
//                            .fontWeight(.bold)
//                    }
                                
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding(.horizontal)
                .padding(.bottom, 45)
                
            }
            .background(Color(.systemIndigo))
            
            Spacer()
            
        }
        
        .edgesIgnoringSafeArea(.top)
        
    }
    
}
