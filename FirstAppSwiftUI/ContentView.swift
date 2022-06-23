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
                
                //First Button --> Click go to Full Conference Squad
                Button(action: {}, label: {
                    NavigationLink(destination: SquadList()) {
                        Text("Full Conference Squad")
                            //.fontWeight(.bold)
                            //.frame(width: 300, height: 300)
                            .foregroundColor(Color.black)
                            .font(.system(size: 18))
                            .padding()
                    }
                    
                }).buttonStyle(.bordered)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue).opacity(0.9))
                
                //Second Button --> Click go to Search Player
                Button(action: {}, label: {
                    NavigationLink(destination: PlayerResearch()) {
                        Text("Search player")
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



struct SquadList : View {
    
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

struct PlayerResearch : View {
    
    @ObservedObject var playerOBJ = playerData()
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView (showsIndicators: false) {
                    ForEach(playerOBJ.playerDataVar){player in
                        VStack (alignment: .leading){
                            Text(String(player.firstName))
                                .fontWeight(.bold)
                            Text(String(player.lastName))
                                .fontWeight(.bold)
                        }
                    }
                    
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







