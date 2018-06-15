//
//  FontsViewController.swift
//  TabBarControllerTask
//
//  Created by Nadiia Pavliuk on 6/12/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit
import Foundation

class FontsViewController: UITableViewController {
    
    var allFonts: [String] = []
    var selectedIndex: IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFontsName()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFonts.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FontsTableViewCell
            else { return UITableViewCell() }
        
        cell.fontNameLabel?.text = allFonts[indexPath.row]
        cell.fontNameLabel?.font = UIFont(name: "\(allFonts[indexPath.row])", size: 17)
        
        let checkMarkToDisplay = UserDefaults.standard.value(forKey: "selectedIndex") as? Int
        
        if checkMarkToDisplay == indexPath.row {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    func getFontsName() {
        for fontFamily in UIFont.familyNames {
            //print("Font family name = \(fontFamily as String)")
            //            self.allFonts.append(fontFamily)
            for fontName in UIFont.fontNames(forFamilyName: fontFamily as String) {
                //  print("Font name = \(fontName)")
                self.allFonts.append(fontName)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.selectedIndex != nil {
            self.tableView.cellForRow(at: self.selectedIndex)?.accessoryType = .none
        }
        if indexPath.row > 0 {
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            self.selectedIndex = indexPath
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.reloadData()
        UserDefaults.standard.set(indexPath.row, forKey: "selectedIndex")
    }
}


class FontsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fontNameLabel: UILabel!
    
}
