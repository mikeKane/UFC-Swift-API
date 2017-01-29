//
//  Fighter.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/21/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Fighter {
    
    var id: Int
    var name: String?
    var nickname: String?
    var statid: Int?
    var titleHolder: Bool?
    var fighter_status: String?
    var ufclink: String?
    var profileImage: UIImage?
    
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
    
    /*
     var statid: Int?
     var titleHolder: Bool?
     var fighter_status: String?
     var ufclink: String?
     */
    var homeTown: Dictionary<String, String>?
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = self.getName(firstName: json["first_name"].string, lastName: json["last_name"].string)
        self.nickname = json["nickname"].string
        self.profileImage = self.getImage(url: json["profile_image"].string!)
    }
    
    private func getImage(url: String) -> UIImage? {
        
        do {
            let data = try Data.init(contentsOf:URL(string:url)!)
            return UIImage(data:data)!
        } catch {
            NSLog("Could not GET image from URL:\(url)")
            return nil
        }
    }
    
    private func getName(firstName: String?, lastName: String?) -> String {
        
        if (firstName == nil || lastName == nil) {
            return "To Be Determined..."
        } else {
            return firstName! + "-" + lastName!
        }
    }
}
