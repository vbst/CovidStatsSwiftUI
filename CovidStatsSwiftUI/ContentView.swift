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
                
                HStack(spacing: 15){
                    
                    VStack(spacing: 12){
                        
                        Text("Случаев")
                            .fontWeight(.bold)
                        
                        Text("555,555")
                            .fontWeight(.bold)
                            .font(.title)
                        
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                    .background(Color(.systemOrange))
                    .cornerRadius(12)
                    
                    
                    
                    VStack(spacing: 12){
                        
                        Text("Смертей")
                            .fontWeight(.bold)
                        
                        Text("5,555")
                            .fontWeight(.bold)
                            .font(.title)
                        
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                    .background(Color(.systemRed))
                    .cornerRadius(12)
                    
                }
                .foregroundColor(.white)
                .padding(.top, 10)
                
                HStack(spacing: 15){
                    
                    VStack(spacing: 12){
                        
                        Text("Здоровы")
                            .fontWeight(.bold)
                        
                        Text("355,555")
                            .fontWeight(.bold)
                        
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                    .background(Color(.systemGreen))
                    .cornerRadius(12)
                    
                    
                    
                    VStack(spacing: 12){
                        
                        Text("Болеют")
                            .fontWeight(.bold)
                        
                        Text("55,555")
                            .fontWeight(.bold)
                        
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                    .background(Color(.systemBlue))
                    .cornerRadius(12)
                    
                    
                    
                    VStack(spacing: 12){
                        
                        Text("Тяжёлые")
                            .fontWeight(.bold)
                        
                        Text("5,555")
                            .fontWeight(.bold)
                        
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                    .background(Color(.systemPurple))
                    .cornerRadius(12)
                }
                .foregroundColor(.white)
                .padding(.top, 10)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 45)
            .background(Color(.systemIndigo))
            
            
    
            VStack(spacing: 15) {
                
                HStack {
                    
                    Text("Последняя неделя")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.top)
                                
                
                
                HStack {
                    
                    ForEach(0...6, id: \.self){_ in
                        
                        VStack(spacing: 10) {
                            
                            Text("555K")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            GeometryReader{g in
                                
                                VStack{
                                    
                                    Spacer(minLength: 0)
                                    
                                    Rectangle()
                                        .fill(Color(.systemPink))
                                        .frame(width: 15)
                                }
                            }
                            .offset(x: 20)
                            
                            Text("28/2/21")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.bottom, -30)
            .offset(y: -30)
        }
        
        .edgesIgnoringSafeArea(.top)
    }
}
