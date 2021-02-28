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
    
    @State var index = 0
    
    var body: some View {
        
        VStack {
            VStack(spacing: 18) {
                
                HStack {
                    
                    Text("Статистика COVID-19")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
      
                    Button {

                    } label: {
                        Text("Россия")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                                
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)

                
                HStack {
                    
                    Button {
                        
                        self.index = 0
                        
                    } label: {
                        Text("Страна")
                            .foregroundColor(self.index == 0 ? .black : .white)
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                    }
                    .background(self.index == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())

                    Button {
                        
                        self.index = 1
                        
                    } label: {
                        Text("Мир")
                            .foregroundColor(self.index == 1 ? .black : .white)
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                    }
                    .background(self.index == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                                        
                }
                .background(Color.black.opacity(0.25))
                .clipShape(Capsule())
                .padding(.top, 10)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 45)
            .background(Color(.systemIndigo))
            
            Spacer()
            
        }
        
        .edgesIgnoringSafeArea(.top)
        
    }
    
}
