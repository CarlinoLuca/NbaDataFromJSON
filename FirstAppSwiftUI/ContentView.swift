//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by user on 20/06/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var text = ""
    @State private var isEditing = false;
    @State private var showingSheet = false
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            //the other code goes here
            VStack {
                ScrollView {
                    //Players
                    HStack(spacing: 270) {
                        Text("Players")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                        
                        Button(action: {}, label: {
                            NavigationLink(destination: PlayersView()) {
                                Text("View All")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .underline()
                            }
                        })
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 20) {
                            /*
                            ForEach(1..<11) {_ in
                                CustomButtonPlayer()
                            }
                             */
                            CustomButtonPlayer()
                        }
                        .padding()
                    }
                    .foregroundColor(.gray)
                    .navigationTitle("NBA Data Info")
                    
                    //Teams
                    HStack(spacing: 270) {
                        Text("Teams")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                        
                        Button(action: {}, label: {
                            NavigationLink(destination: TeamsView()) {
                                Text("View All")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .underline()
                            }
                        })
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 20) {
                            /*
                            ForEach(1..<11) {_ in
                                CustomButtonTeam()
                            }
                             */
                            CustomButtonTeam()
                        }
                        .padding()
                    }
                    .foregroundColor(.gray)
                    
                    //posts
                    HStack {
                        Text("Posts")
                            .foregroundColor(.red)
                            .font(.system(size: 24, weight: .bold, design: .default))
                    }
                    
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridItemLayout, spacing: 20) {
                            ForEach(1..<5) {_ in
                                CustomButtonPost()
                            }
                            
                        }
                        .padding()
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("View more post")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .underline()
                            })
                        }
                        .foregroundColor(.gray)
                        
                    }
                }
                .background(
                    Image("jordan")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fill)
                )
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white)]
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomButtonPlayer: View {
    
    @ObservedObject var playerOBJ = playerData()
    
    var body: some View {
        ForEach(playerOBJ.playerDataVar){ giocatore in
            Button(action: {}, label: {
                Text(giocatore.lastName + " " + giocatore.firstName)
                    .font(.system(size: 18))
                    .padding()
            })
            .frame(width: 100, height: 100, alignment: .leading)
            .foregroundColor(.white)
            .padding()
            .background(Color.gray)
            .cornerRadius(25)
            .shadow(color: .white, radius: 2, x: 0, y: 5)
        }
    }
}

struct CustomButtonTeam: View {
    
    @ObservedObject var nbaConference = nbaData()
    
    var body: some View {
        ForEach (nbaConference.nbaDataArr) {squad in
            Button(action: {}, label: {
                Text(squad.fullName)
                    .font(.system(size: 18))
                    .padding()
            })
            .frame(width: 100, height: 100, alignment: .leading)
            .foregroundColor(.white)
            .padding()
            .background(Color.gray)
            .cornerRadius(25)
            .shadow(color: .white, radius: 2, x: 0, y: 5)
        }
        
    }
}

struct CustomButtonPost: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Post 1")
                .font(.system(size: 18))
                .padding()
        })
        .frame(width: 150, height: 150, alignment: .center)
        .foregroundColor(.white)
        .padding()
        .background(Color.gray)
        .cornerRadius(25)
        .shadow(color: .white, radius: 2, x: 0, y: 5)
    }
}

