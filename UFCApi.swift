//
//  UFCApi.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/20/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit

class UFCApi: NSObject {

    let newsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/news"
    let mediaURL = "http://ufc-data-api.ufc.com/api/v3/iphone/media"
    let titleHoldersURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/title_holders"
    let fightersURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters"
    let statsFilterKeyValueURL = "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/stats_filter_key_values"
    let octagonGirlsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/octagon_girls"
    let eventsURL = "http://ufc-data-api.ufc.com/api/v3/iphone/events"
    
    //newsURL will produce an ID to be input for article
    func newsArticleURL(nID id: String) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/news/\(id)"
    }
    
    func mediaItemURL(mID id: String) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/media/\(id)"
    }
    
    //Born Country can have an empty string to bring back all countries.
    func fighterStats(wClass weightClass: String, bCountry bornCountry: String?) -> String {
        return "http://ufc-data-api.ufc.com/api/v3/iphone/fighters/stats/weight_class/:\(weightClass)/born_country/:\(bornCountry ?? "")"
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
