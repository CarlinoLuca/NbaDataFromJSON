//
//  dataScraperNBA.swift
//  FirstAppSwiftUI
//
//  Created by user on 01/07/22.
//

import Foundation
import SwiftSoup
//import OpenGL


struct playerDataScraper{
    var nomeGiocatore :String
    var nomeCompleto :String
    var linkImmagine :String
    //var social :[String] // array di stringhe contente tutti i social del giocatore
    
}

//var allPlayerData :playerData = playerData(nomeGiocatore: "", nomeCompleto: "", social: [])

//per creare il link del giocatore --> prime cinque lettere cognome piu' le prime due del nome + 01 --> che può incrementarsi

//let url = URL(string:"https://www.basketball-reference.com/players/c/curryst01.html")!
//var html = ""

class dataScraperInfo {
    
    
    //occhio al link dell'immagine, di mettere il nome +jpg
    var allPlayerData :playerDataScraper = playerDataScraper(nomeGiocatore: "", nomeCompleto: "", linkImmagine: "https://www.basketball-reference.com/req/202106291/images/players/")
    
    init(nomeGiocatore: String, cognomeGiocatore: String){
        
        var stringURL = createLinkSearchPlayer(nomeGiocatore: nomeGiocatore, cognomeGiocatore: cognomeGiocatore)
        stringURL = checkIfIsCorrectPlayer(nomeGiocatore: nomeGiocatore, cognomeGiocatore: cognomeGiocatore, urlCompleto: stringURL)
        
        let url = URL(string: stringURL)!
        
        //let url = URL(string:"https://www.basketball-reference.com/players/c/curryst01.html")!
        
        var html = ""
        
        do{
            html = try String(contentsOf: url)
            //print(html.prefix(2000))
        }catch{
            //let html = ""
            print(error.localizedDescription)
        }
        
        //prende tutto il documento
        let document = try! SwiftSoup.parse(html)
        //print(try document.title())
        
        // prende solo parte del div con id meta
        let descriptionTest = try! document.select("#meta").first()!
        //print(descriptionTest)
        
        // prende solamente il primo span del div con id meta --> contiene il nome
        let span = try! descriptionTest.select("span").first()!
        //print(try span.text())
        
        allPlayerData.nomeGiocatore = (try! span.text())
        
        // prende prende il nome completo
        let strong = try! descriptionTest.select("strong").first()!
        
        allPlayerData.nomeCompleto = (try! strong.text())
        
        // array che contiene nome e cognome e i dati principali
        //var elementiString :[String] = []
        
        
    }
    
    
    
    
    
    func createLinkSearchPlayer(nomeGiocatore: String, cognomeGiocatore: String) -> String{
        let urlBase = "https://www.basketball-reference.com/players"
        //let urlBase = "https://www.basketball-reference.com/players/c/"
        var index = cognomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 5)
        let FiveLetterOfSurname = cognomeGiocatore[..<index]
        index = nomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 2)
        let ThreeLetterOfName = nomeGiocatore[..<index]
        index = cognomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 1)
        return urlBase + "/" + cognomeGiocatore[..<index].lowercased() + "/" + FiveLetterOfSurname.lowercased() + ThreeLetterOfName.lowercased() + "01.html"
    }
    
    
    func checkIfIsCorrectPlayer(nomeGiocatore: String,cognomeGiocatore: String , urlCompleto: String) -> String {
        var htmlCheck = ""
        //var urlCheck = URL(string:urlCompleto)
        do{
            htmlCheck = try String(contentsOf: URL(string:urlCompleto)!)
            //print(html.prefix(2000))
        }catch{
            //let html = ""
            print(error.localizedDescription)
        }
        
        var documentCheck = try! SwiftSoup.parse(htmlCheck)
        var nomePresuntoGiocatore = try! documentCheck.title()
        var nameParsed = nomePresuntoGiocatore.replacingOccurrences(of: " Stats | Basketball-Reference.com", with: "")
        //print(nameParsed)
        
        if(nameParsed == nomeGiocatore + " " + cognomeGiocatore){
            print(urlCompleto)
            return urlCompleto
        }
        var contatorePerUrl = 2
        var newURL = ""
        repeat{
            newURL = urlCompleto.replacingOccurrences(of: "01.html", with: "0" + String(contatorePerUrl) + ".html")
            //print(indexG)
            print(newURL)
            
            do{
                htmlCheck = try String(contentsOf: URL(string:newURL)!)
                //print(html.prefix(2000))
            }catch{
                //let html = ""
                print(error.localizedDescription)
            }
            documentCheck = try! SwiftSoup.parse(htmlCheck)
            nomePresuntoGiocatore = try! documentCheck.title()
            nameParsed = nomePresuntoGiocatore.replacingOccurrences(of: " Stats | Basketball-Reference.com", with: "")
            print(nameParsed)
            //print(contatorePerUrl)
            contatorePerUrl += 1
        }while(nameParsed != nomeGiocatore + " " + cognomeGiocatore)
        return newURL
    }
}
















/*
for elem in p {
    elementiString.append(try elem.text())
    
}


// tocca droppare gli elementi inutili
//print(elementiString)


let getTable = try document.select("#bling")
let getSingleCell = try getTable.select("a")

//array che contiente tutti i possibili premi vinti dal giocatore ---- Attenzione possibilità che non ce ne siano
var tuttiIPremi :[String] = []

for eee in getSingleCell{
    tuttiIPremi.append(try eee.text())
}

func createLinkSearchPlayer(nomeGiocatore: String, cognomeGiocatore: String) -> String{
    let urlBase = "https://www.basketball-reference.com/players"
    //let urlBase = "https://www.basketball-reference.com/players/c/"
    var index = cognomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 5)
    let FiveLetterOfSurname = cognomeGiocatore[..<index]
    index = nomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 2)
    let ThreeLetterOfName = nomeGiocatore[..<index]
    index = cognomeGiocatore.index(cognomeGiocatore.startIndex, offsetBy: 1)
    return urlBase + "/" + cognomeGiocatore[..<index].lowercased() + "/" + FiveLetterOfSurname.lowercased() + ThreeLetterOfName.lowercased() + "01.html"
}


// una volta creato l'url bisogna verificare che sia il giocatore giusto

func checkIfIsCorrectPlayer(nomeGiocatore: String,cognomeGiocatore: String , urlCompleto: String) -> String {
    var htmlCheck = ""
    //var urlCheck = URL(string:urlCompleto)
    do{
        htmlCheck = try String(contentsOf: URL(string:urlCompleto)!)
        //print(html.prefix(2000))
    }catch{
        //let html = ""
        print(error.localizedDescription)
    }
    
    var documentCheck = try! SwiftSoup.parse(htmlCheck)
    var nomePresuntoGiocatore = try! documentCheck.title()
    var nameParsed = nomePresuntoGiocatore.replacingOccurrences(of: " Stats | Basketball-Reference.com", with: "")
    //print(nameParsed)
    
    if(nameParsed == nomeGiocatore + " " + cognomeGiocatore){
        print(urlCompleto)
        return urlCompleto
    }
    var contatorePerUrl = 2
    var newURL = ""
    repeat{
        newURL = urlCompleto.replacingOccurrences(of: "01.html", with: "0" + String(contatorePerUrl) + ".html")
        //print(indexG)
        print(newURL)
        
        do{
            htmlCheck = try String(contentsOf: URL(string:newURL)!)
            //print(html.prefix(2000))
        }catch{
            //let html = ""
            print(error.localizedDescription)
        }
        documentCheck = try! SwiftSoup.parse(htmlCheck)
        nomePresuntoGiocatore = try! documentCheck.title()
        nameParsed = nomePresuntoGiocatore.replacingOccurrences(of: " Stats | Basketball-Reference.com", with: "")
        print(nameParsed)
        //print(contatorePerUrl)
        contatorePerUrl += 1
    }while(nameParsed != nomeGiocatore + " " + cognomeGiocatore)
    return newURL
}

checkIfIsCorrectPlayer(nomeGiocatore: "Ray", cognomeGiocatore: "Allen", urlCompleto: "https://www.basketball-reference.com/players/a/allenra01.html")
*/
