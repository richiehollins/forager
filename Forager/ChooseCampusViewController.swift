//
//  ChooseCampusViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 8/3/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class ChooseCampusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var theCampuses: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theCampuses = ["1750","Clarendon","East Shore","Knolls","McLean","NYC","Plano","San Francisco","Towers","West Creek"]

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theCampuses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // tell it about the LocationTableViewCell.swift file
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationTableViewCell") as! LocationTableViewCell
    
        let campusName = theCampuses[indexPath.row]
    
        cell.locationTableCellLabel.text = campusName
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! LocationTableViewCell
        
        selectedCampus = currentCell.locationTableCellLabel.text!
        hasSelectedCampus = true
        hasSelectedBuildingFloor = false
        navigationController?.popViewControllerAnimated(true)
        
    }

    @IBAction func didTapBackArrow(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
