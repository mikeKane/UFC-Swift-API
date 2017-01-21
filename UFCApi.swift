//
//  UFCApi.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/20/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit

struct APIStrings {
    
    static  let newsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/news"
    static  let mediaURL = "http://ufc-data-api.ufc.com/api/v3/iphone/media"
    static  let eventsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/events"
    
    static  let titleHoldersURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/title_holders"
    static  let octagonGirlsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/octagon_girls"
    
    static  let fightersURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters"
    
    //newsURL will produce an ID to be input for article
    func newsArticleURL(nID id: String) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/news/\(id)"
    }
    
    func mediaItemURL(mID id: String) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/media/\(id)"
    }
    
    //Basically Different way to filter the fighters
    //Born Country can have an empty string to bring back all countries.
    static  let statsFilterKeyValueURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/stats_filter_key_values"
    
    func fighterStats(wClass weightClass: String, bCountry bornCountry: String?) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/stats/weight_class/:\(weightClass)/born_country/:\(bornCountry ?? "")"
    }
    
    
    //Pass in a fighters name ex: conor-mcgregor. Must have dash. Must end in .json
    func detailedFighterStats(fighter name: String) -> String {
        return "http://nlds230.cdnak.neulion.com/fs/ufc/common/fighter/json/\(name).json"
    }
    
    //Pass in the fighter id returned from the fightersURL. Returns news and and media URLs in that order
    func fighterNewsAndMediaURL(fID id: String) -> (String,String) {
        return ("http://ufc-data-api.ufc.com/api/v3/iphone/fighters/:\(id)/news","http://ufc-data-api.ufc.com/api/v3/iphone/fighters/:\(id)/media")
    }
    
    //Pass in the Octagon id returned from the octagonGirlsURL
    func octagonGirlURL(gID id: String) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/octagon_girls/\(id)"
    }
    
    //Pass in the events id returned from the eventsURL
    //Returns URLs for the single event, fights in the event, media(gallery), highlights & tickets. In that order
    func eventURL(eID id: String) -> (String,String,String,String,String) {
        return ("http://ufc-data-api.ufc.com/api/v3/iphone/events/\(id)","http://ufc-data-api.ufc.com/api/v3/iphone/events/:\(id)/fights", "http://ufc-data-api.ufc.com/api/v3/iphone/events/\(id)/media","http://ufc-data-api.ufc.com/api/v3/iphone/events/\(id)/highlights","http://ufc-data-api.ufc.com/api/v3/iphone/events/\(id)/tickets")
    }
}

class UFCApi: NSObject {
    
    /* This will load the main table. When a user selects fighters it will display a large ist of fighters. I can parse them into sections if I wish with search etc. But lets get the data first. Once this finishes and saves, I will parse the .json file. I can then iterate over the names and pull the detailed stats.
     */
    //Once fighters load DO I pull the additional data right away or load that when a user clicks a fighter. Seems like the overhead up frint is massive.
    //Display all fighters. Perform a cool animaion - grab the fighters ID and grab the news and media.
    
    
    func getJSOnObjects(url: String, fileName: String) {
        
        let jsonString = APIStrings.fightersURL
        
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let writePath = documents + ("\(fileName).json")
        
        do {
            try jsonString.write(toFile: writePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            NSLog("Could not save to \(fileName).json")
        }
    }
}
