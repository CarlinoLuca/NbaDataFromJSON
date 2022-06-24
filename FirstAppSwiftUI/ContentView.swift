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
        //NavigationView {
            //VStack{
                
                List{
                    Section(header: Text("East")) {
                        ForEach(nbaConference.nbaDataArr){squad in
                            if(String(squad.conference) == "East"){
                                //Text(String(squad.fullName))
                                
                                NavigationLink(String(squad.fullName).capitalized,
                                               destination: SquadInfoO(nomeSquadra: String(squad.fullName))
                                )
                            }
                        }
                        
                    }
                    
                    Section(header: Text("West")) {
                        ForEach(nbaConference.nbaDataArr){squad in
                            if(String(squad.conference) == "West"){
                                NavigationLink(String(squad.fullName).capitalized,
                                               destination: SquadInfoO(nomeSquadra: String(squad.fullName))
                                )
                            }
                        }
                    }
                }.listStyle(.grouped)
            
                    
            //}
            
        //} //.navigationBarTitle("Squad Info")
        
        //.navigationBarTitleDisplayMode(.inline)
        /*
        .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Squad Info")
                }
            }
        *///.navigationBarTitle("Squad Info")
            //.navigationBarHidden(true)
    }
    
    //.navigationBarHidden(true)
    
}



struct PlayerResearch : View {
    
    @ObservedObject var playerOBJ = playerData()
    
    var body: some View {
        ZStack{
            VStack{
                /*
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
                */
                
                List(playerOBJ.playerDataVar){player in
                    Text("\(String(player.firstName)) \(String(player.lastName))")
                    //Text(String(player.lastName))
                    //Text(Int(player.heightFeet)!)
                    //Text(Int(player.heightInches)!)
                    //Text(String(player.position))
                    //Text(Int(player.weightPounds)!)
                    /*
                    Section(header: Text("East")) {
                        ForEach(nbaConference.nbaDataArr){squad in
                            if(String(squad.conference) == "East"){
                                //Text(String(squad.fullName))
                                
                                NavigationLink(String(squad.fullName).capitalized,
                                               destination: SquadInfoO(nomeSquadra: String(squad.fullName))
                                )
                            }
                        }
                        
                    }
                     */
                    
                    
                }
            }
        }
    }
}


struct SquadInfoO : View {
    
    //@ObservedObject var playerOBJ = playerData()
    @State var nomeSquadra :String
    
    var body: some View {
        ZStack{
            VStack{
                Text(nomeSquadra)
            }
        }
    }
     
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







