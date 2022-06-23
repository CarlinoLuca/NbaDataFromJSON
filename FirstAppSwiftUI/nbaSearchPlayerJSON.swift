//
//  nbaSearchPlayerJSON.swift
//  FirstAppSwiftUI
//
//  Created by user on 23/06/22.
//

import Foundation
import SwiftyJSON

// MARK: - PlayerInfo
struct PlayerInfo :Decodable, Identifiable{
    let id: Int
    let firstName: String
    let heightFeet, heightInches: Int?
    let lastName, position: String
    let team: TeamInfo
    let weightPounds: Int?
}

// MARK: - Team
struct TeamInfo :Decodable, Identifiable{
    let id: Int
    let abbreviation :String
    let city :String
    let conference :String
    let division: String
    let fullName :String
    let name: String
}



class playerData: ObservableObject {
    //@Published var
    @Published var playerDataVar = [PlayerInfo]()

    
    init() {
        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil {
                print(err.debugDescription)
            }
            let json = try! JSON(data: data!)
            print(json["data"])
            
            
            for i in json["data"] {
                let id = i.1["id"].rawValue as! Int
                let firstName = i.1["firstName"].stringValue
                let heightFeet = Int(i.1["heightFeet"].stringValue) ?? 0
                let heightInches = Int(i.1["heightInches"].stringValue) ?? 0
                let lastName = i.1["lastName"].stringValue
                let position = i.1["position"].stringValue
                let weightPounds = Int(i.1["weightPounds"].stringValue) ?? 0
                
                var teaminfo = TeamInfo(id: 0, abbreviation: "", city: "", conference: "", division: "", fullName: "", name: "")
                
                for x in i.1["team"]{
                    teaminfo = TeamInfo(
                                        id: x.1["id"].rawValue as? Int ?? 0,
                                        abbreviation: x.1["abbreviation"].stringValue,
                                        city: x.1["city"].stringValue,
                                        conference: x.1["conference"].stringValue,
                                        division: x.1["division"].stringValue,
                                        fullName: x.1["fullName"].stringValue,
                                        name: x.1["name"].stringValue)
                }
                
            
                DispatchQueue.main.async {
                    self.playerDataVar.append(PlayerInfo(id: id, firstName: firstName, heightFeet: heightFeet, heightInches: heightInches, lastName: lastName, position: position, team: teaminfo, weightPounds: weightPounds))
                }
            }
             
             
        }.resume()
    }
    

}

