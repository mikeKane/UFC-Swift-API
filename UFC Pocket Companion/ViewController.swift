//
//  ViewController.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/20/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let ufc = UFCApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doDone), name:  NSNotification.Name.init(rawValue: "downloadFinished"), object: nil)
        self.ufc.getJSOnObjects()
    }
    
    func doDone(){
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ufc.jsonArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (ufc.jsonArray?.count)! > 0 {
            if ufc.jsonArray?[indexPath.row]["first_name"].string != nil && ufc.jsonArray?[indexPath.row]["last_name"].string != nil {
            cell?.textLabel?.text = (ufc.jsonArray?[indexPath.row]["first_name"].string)! + " " + (ufc.jsonArray?[indexPath.row]["last_name"].string!)!
            }
        }
        return cell!
    }
}
//Sort into male/female?
