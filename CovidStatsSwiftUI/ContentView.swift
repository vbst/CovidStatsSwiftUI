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
    @State var main : MainData!
    
    var body: some View {
        
        VStack{
            
            if self.main != nil{
                
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
                                self.main = nil
                                self.getData()
                                
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
                                self.main = nil
                                self.getData()
                                
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
                                
                                Text("\(self.main.cases)")
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
                                
                                Text("\(self.main.deaths)")
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
                                
                                Text("\(self.main.recovered)")
                                    .fontWeight(.bold)
                                
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .background(Color(.systemGreen))
                            .cornerRadius(12)
                            
                            
                            
                            VStack(spacing: 12){
                                
                                Text("Болеют")
                                    .fontWeight(.bold)
                                
                                Text("\(self.main.active)")
                                    .fontWeight(.bold)
                                
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .background(Color(.systemBlue))
                            .cornerRadius(12)
                            
                            
                            
                            VStack(spacing: 12){
                                
                                Text("Тяжёлые")
                                    .fontWeight(.bold)
                                
                                Text("\(self.main.critical)")
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
            }
            else {
                
                Indicator()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            
            self.getData()
        }
    }
    
    func getData(){
        
        var url = ""
        
        if self.index == 0 {
            
            url = "https://corona.lmao.ninja/v2/countries/russia?yesterday=false"
        }
        else{
            
            url = "https://corona.lmao.ninja/v2/all?today"
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSONDecoder().decode(MainData.self, from: data!)
            
            self.main = json
        }
        .resume()
        
        
        
    }
}


struct Daily: Identifiable{
    
    var id : Int
    var day : String
    var cases : Int
}

struct MainData : Decodable{
    
    var deaths : Int
    var recovered : Int
    var active : Int
    var critical : Int
    var cases : Int
}

struct MyCountry : Decodable {
    
    var timeline : [String : [String : Int]]
}

struct Global : Decodable {
    
    var cases : [String : Int]
}

struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: Context) ->  UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView:  UIActivityIndicatorView, context: Context) {
        
        
    }
}
