//
//  fetchingDataJson.swift
//  FirstAppSwiftUI
//
//  Created by user on 20/06/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nbaPlayer = try? newJSONDecoder().decode(NbaPlayer.self, from: jsonData)

import Foundation
import SwiftyJSON


/*
// MARK: - Welcome8
struct nbaConferenceData :Decodable{
    var nbaData: [SquadInfo]
    //let meta: Meta?
}
*/

// MARK: - Datum
struct SquadInfo :Decodable, Identifiable{
    let id: Int
    let abbreviation : String
    let city: String
    let conference: String
    let division: String
    let fullName: String
    let name: String
}

/*
enum Conference :Decodable{
    case east
    case west
}
 */
/*
struct Meta :Decodable{
    let totalPages, currentPage: Int?
    var nextPage :Int?
    let perPage, totalCount: Int?
}
*/




class nbaData: ObservableObject {
    //@Published var
    @Published var nbaDataArr = [SquadInfo]()
    
    init() {
        let url = URL(string: "https://www.balldontlie.io/api/v1/teams")!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil {
                print(err.debugDescription)
            }
            let json = try! JSON(data: data!)
            //print(json["data"])
            
            
            for i in json["data"] {
                let id = i.1["id"]
                let abbreviation = i.1["abbreviation"].stringValue
                let city = i.1["city"].stringValue
                let conference = i.1["conference"].stringValue
                let division = i.1["division"].stringValue
                let fullName = i.1["fullName"].stringValue
                let name = i.1["name"].stringValue
            
                DispatchQueue.main.async {
                    //self.nbaDataArr.append(SquadInfo(id: id, abbreviation: abbreviation, city: city, conference: conference, division: division, fullName: fullName, name: name))
                    self.nbaDataArr.append(SquadInfo(id: id.rawValue as! Int, abbreviation: abbreviation, city: city, conference: conference, division: division, fullName: fullName, name: name))
                }
            }
             
             
        }.resume()
    }
    
    func testprinting(){
        print(nbaDataArr)
    }

}

