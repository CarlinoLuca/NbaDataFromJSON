//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by user on 20/06/22.
//

import SwiftUI


struct ContentView: View {
    
    //@State var results = [TaskEntry]()
    //@State var results = [NbaState]()
    @ObservedObject var nbaConference = nbaData()
    
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView {
                        /*
                         List(nbaConference.nbaDataArr) { squadra in
                         VStack(alignment: .leading) {
                         Text(String(squadra.name))
                         .fontWeight(.bold)
                         Text(String(squadra.fullName))
                         .fontWeight(.bold)
                         }
                         }
                         */
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
                
                
                
                /*
                VStack{
                    VStack{
                        Button("Parsing data"){
                            loadData()
                        }
                        VStack(alignment: .leading){
                            Text("String(nbaData.data[0].name)")
                        }
                        //Text(foxOBJ.link)
                        
                    }.onAppear(perform: loadData)
                 */
                    //Button("Refreshing data"){self.loadData()}
                    //Text("\(nbaData.data[0].name)")
                    /*
                     
                     
                    
                     *//*
                    //Text("Hello World")
                    Button(action: {}, label: {
                        NavigationLink(destination: ContentViewB()) {
                            Text("Open view Numeber 2")
                                .fontWeight(.bold)
                        }
                    }).buttonStyle(.bordered)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).opacity(0.4))
                        
                }
                        */
                
                
            }
        }
    }

}



struct ContentViewB : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World B")
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







