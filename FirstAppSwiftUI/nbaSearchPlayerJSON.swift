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
            //print(json["data"])
            
            
            for i in json["data"] {
                let id = i.1["id"].rawValue as! Int
                let firstName = i.1["first_name"].stringValue
                let heightFeet = Int(i.1["height_feet"].stringValue) ?? 0
                let heightInches = Int(i.1["height_inches"].stringValue) ?? 0
                let lastName = i.1["last_name"].stringValue
                let position = i.1["position"].stringValue
                let weightPounds = Int(i.1["weight_pounds"].stringValue) ?? 0
                
                
                
                var teaminfo = TeamInfo(id: 0, abbreviation: "", city: "", conference: "", division: "", fullName: "", name: "")
                //print(i.1["team"])
                //print(i.1["team"]["full_name"])
                teaminfo = TeamInfo(
                                    id: i.1["team"]["id"].rawValue as? Int ?? 0,
                                    abbreviation: i.1["team"]["abbreviation"].stringValue,
                                    city: i.1["team"]["city"].stringValue,
                                    conference: i.1["team"]["conference"].stringValue,
                                    division: i.1["team"]["division"].stringValue,
                                    fullName: i.1["team"]["full_name"].stringValue,
                                    name: i.1["team"]["name"].stringValue)
                /*
                for x in i.1["team"]{
                    
                    /*
                    print(x.1["full_name"])
                    teaminfo = TeamInfo(
                                        id: x.1["id"].rawValue as? Int ?? 0,
                                        abbreviation: x.1["abbreviation"].stringValue,
                                        city: x.1["city"].stringValue,
                                        conference: x.1["conference"].stringValue,
                                        division: x.1["division"].stringValue,
                                        fullName: x.1["full_name"].stringValue,
                                        name: x.1["name"].stringValue)
                    //print("Team Info nel for:")
                   */
                    let id2 = x.1["id"].rawValue as? Int ?? 0
                    let abbreviation2 = x.1["abbreviation"].stringValue
                    let city2 = x.1["city"].stringValue
                    let conference2 = x.1["conference"].stringValue
                    let division2 = x.1["division"].stringValue
                    let fullName2 = x.1["full_name"].stringValue
                    let name2 = x.1["name"].stringValue
                    //print(abbreviation2)
                }
                */
                //print("")
                
                
                //print("Team Info:")
                //print(teaminfo)
                DispatchQueue.main.async {
                    self.playerDataVar.append(PlayerInfo(id: id, firstName: firstName, heightFeet: heightFeet, heightInches: heightInches, lastName: lastName, position: position, team: teaminfo, weightPounds: weightPounds))
                }
                //print(self.playerDataVar)
                
            }
             
             
        }.resume()
    }
    

}

