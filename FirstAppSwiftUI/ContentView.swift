//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by user on 20/06/22.
//

import SwiftUI


struct ContentView: View {
    
    
    
    
    var body: some View {
        NavigationView{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("NBA data infos")
                    .font(.system(size: 30))
                    .padding()
                    .frame(height: 300, alignment: .top)
                Button(action: {}, label: {
                    NavigationLink(destination: ContentViewB()) {
                        Text("Open view Numeber 2")
                            //.fontWeight(.bold)
                            //.frame(width: 300, height: 300)
                            .foregroundColor(Color.black)
                            .font(.system(size: 18))
                            .padding()
                    }
                    
                }).buttonStyle(.bordered)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue).opacity(0.9))
            }
        }
        
        
    }
    }

}



struct ContentViewB : View {
    
    @ObservedObject var nbaConference = nbaData()
    
    var body: some View {
        NavigationView {
            
          
            ZStack{
                
                VStack{
                    ScrollView (showsIndicators: false) {
                        ForEach(nbaConference.nbaDataArr){squadra in
                            VStack (alignment: .leading){
                                Text(String(squadra.name))
                                    .fontWeight(.bold)
                                Text(String(squadra.fullName))
                                    .fontWeight(.bold)
                            }
                        }
                        
                    }
                }
                
            }   .navigationBarTitle("")
                .navigationBarHidden(true)
            
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







