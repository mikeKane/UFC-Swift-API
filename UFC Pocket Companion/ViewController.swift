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
        
        do {
            jsonString = try String(contentsOf:NSURL(string: APIStrings.fightersURL) as! URL, encoding: String.Encoding.utf8)
        } catch {
            print("Error with URL")
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent("fighters.json")
            
            //writing
            do {
                try jsonString.write(to: path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let fighterData = try Data(contentsOf: path)
                let json = JSON(data: fighterData)
                
                let array = json
                print("\(array[0]["first_name"])")
            }
            catch {/* error handling here */}
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//Sort into male/female?
