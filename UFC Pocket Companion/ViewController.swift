//
//  ViewController.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/20/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var jsonString = ""
        var json : JSON
        
        //Put on BG queue but make this an ultra high priority. This is quick.
        do {
            jsonString = try String(contentsOf:NSURL(string: APIStrings.fightersURL) as! URL, encoding: String.Encoding.utf8)
        } catch {
            print("Error with URL")
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let path = dir.appendingPathComponent("fighters.json")
            
            do {
                try jsonString.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
            
            //When the BG queue of fighters comes back , well get alerted to start this.
            do {
                json = try JSON(data: Data(contentsOf: path))
                var open: Int = 0
                for i in 0 ... json.count {
                    
                    var fighter = Fighter.init(first: json[i]["first_name"].string, last: json[i]["last_name"].string, fighterId:44)
                    fighter.fighter_status = json[i]["fighter_status"].string
                    
                    if fighter.name != "" && fighter.fighter_status == "Active" {
                        let url = NSURL(string:APIStrings.detailedFighterStats(name:fighter.name!))
                        open += 1
                        print("Active fighters: \(open)")
                        if url != nil {
                            do {
                                print("Trying url: \(url)")
                                jsonString = try String(contentsOf:url as! URL, encoding: String.Encoding.utf8)
                                print("\(jsonString) + \(i)")
                            } catch {
                                print("JSON does not exist:\n \(url)index:\(i)")
                            }
                        } else {
                            print("url is nil::: Fighter = \(fighter.name)")
                        }
                    }
                }
            }
            catch {NSLog("This is not working")}
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//Sort into male/female?
