//
//  ViewController.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/20/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

/*
 Notes: When scrolling on tableview. When you scroll past the first loaded fighters have the segment/search bar dissapear. Have it reappear when scrolling back up
 
 Note 2: Put a magnifying glass sit top right. When pressed the search bar comes in from the right and the segment leaves to the left. REVERSE that when tapped again.
 */
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let ufc = UFCApi()
    var cell = Cell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ufc.getJSOnObjects(url:URL(string: APIStrings.fightersURL)!, filename: "fighters.json")
        NotificationCenter.default.addObserver(self, selector: #selector(downloadFinished), name:  NSNotification.Name.init(rawValue: "downloadFinished"), object: nil)
    }
    
    func downloadFinished(){
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ufc.jsonArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        
        if (ufc.jsonArray?.count)! > 0 {
            
            let currentFighter = Fighter(json: (ufc.jsonArray?[indexPath.row])!)

            cell.fighterName?.text = currentFighter.name
            cell.nickName?.text = currentFighter.nickname
            cell.fighterImage.image = currentFighter.profileImage
            
            cell.wightClassLabel.text = (ufc.jsonArray?[indexPath.row]["weight_class"].string)
            let rank = (ufc.jsonArray?[indexPath.row]["rank"].string) ?? "NR"
            cell.rankLabel.text = "Rank: " + rank
            cell.winValueLabel.text = "\((ufc.jsonArray?[indexPath.row]["wins"].intValue)!)"
            cell.lossValueLabel.text = "\((ufc.jsonArray?[indexPath.row]["losses"].intValue)!)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
