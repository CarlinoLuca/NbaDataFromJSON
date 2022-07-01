//
//  TeamsView.swift
//  TestUI
//
//  Created by user on 28/06/22.
//

import SwiftUI

struct TeamsView: View {
    @State var text = ""
    @State private var isEditing = false;
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    HStack {
                        ScrollView(.vertical,showsIndicators: false) {
                            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                                ForEach(1..<31) {_ in
                                    CustomButtonTeams()
                                }
                            }
                            .padding()
                        }
                        .foregroundColor(.gray)
                        .navigationTitle("Teams")
                    }
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
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.white)]
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}

struct CustomButtonTeams: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Team 1")
                .font(.system(size: 16))
                .padding()
        })
        .frame(width: 80, height: 80, alignment: .leading)
        .foregroundColor(.white)
        .padding()
        .background(Color.gray)
        .cornerRadius(25)
        .shadow(color: .white, radius: 2, x: 0, y: 5)
    }
}
