//
//  Fighter.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/21/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import Foundation

struct Fighter {
    
    var id: Int
    var name: String?
    var nickname: String?
    var statid: Int?
    var titleHolder: Bool?
    var fighter_status: String?
    var ufclink: String?
    
    //Image URLs
    var right_full_body_image: String?
    var left_full_body_image: String?
    var thumbnail: String?
    var profile_image: String?
    var belt_thumbnail: String?
    
    //Stats
    var draws: Int?
    var weight_class: String?
    var pound_for_pound_rank: String?
    var wins: Int?
    var losses: Int?
    var rank: String?
    
    //Detailed Stats
    var tdacc: String?
    var statId: String?
    var tddef: String?
    var reach: Int?
    var heightcm: Int?
    var subavg: String?
    var champ: Bool?
    var height: String?
    var strdef: String?
    var slpm: String?
    var stracc: String?
    var weight: Int?
    var tdavg: String?
    var age: Int?
    var sapm: String?
    /* "fighthome":{
     "country":"USA",
     "city":"Parkland",
     "state":"WA"
     }*/
    var fighthome: Dictionary<String, String>?
    
    /*
     "home":{
     "country":"USA",
     "city":"Madisonville",
     "state":"KY"
     },*/
    var homeTown: Dictionary<String, String>?
    
    init(first firstName: String?,last lastName: String?,fighterId fid: Int?) {
        
        if (firstName == nil || lastName == nil) {
            name = ""
            id = 9
        } else {
            name = firstName! + "-" + lastName!
            id = fid!
        }
    }
}
