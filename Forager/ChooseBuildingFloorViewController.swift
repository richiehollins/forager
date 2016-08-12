//
//  ChooseBuildingFloorViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 8/12/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class ChooseBuildingFloorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var westCreekBuildings: [String]!
    var towersFloors: [String]!
    var seventeenFiftyFloors: [String]!
    var mcLeanFloors: [String]!
    var planoBuildings: [String]!
    var nycFloors: [String]!
    var wackerFloors: [String]!
    var clarendon: [String]!
    var knollsBuildings: [String]!
    var eastShoreBuildings: [String]!
    var sanFranciscoBuildings: [String]!
    
    var activeBuildingRoomArray: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        westCreekBuildings = ["WC1","WC2","WC3","WC4","WC5","WC6","WC7","WC8","Town Center","Commons"]
        towersFloors = ["2nd Floor","3rd Floor","4th Floor","5th Floor","6th Floor","7th Floor","8th Floor","9th Floor"]
        seventeenFiftyFloors = ["4th Floor","5th Floor","6th Floor","7th Floor","8th Floor","12th Floor"]
        mcLeanFloors = ["1st Floor","3rd Floor","4th Floor","5th Floor","6th Floor","7th Floor","8th Floor","9th Floor","10th Floor","11th Floor","12th Floor","13th Floor"]
        planoBuildings = ["Plano 1","Plano 2","Plano 3","Plano 5","Plano 6","Town Center"]
        nycFloors = ["4th Floor","5th Floor","6th Floor"]
        wackerFloors = ["8th Floor","9th Floor","10th Floor","11th Floor","22nd Floor"]
        clarendon = []
        knollsBuildings = ["Knolls 1","Knolls 2","Knolls 3","Knolls 4","Knolls 5"]
        eastShoreBuildings = ["ES1","ES2"]
        sanFranciscoBuildings = ["201 3rd St","22 4th St","101 Post St"]

        
        if (hasSelectedCampus == false) {
            if (detectedLocation == "West Creek") {
                navBar.title = "Choose Building"
                activeBuildingRoomArray = westCreekBuildings
            }
            else if (detectedLocation == "Towers") {
                navBar.title = "Choose Floor"
                activeBuildingRoomArray = towersFloors
            }
            else if (detectedLocation == "McLean") {
                navBar.title = "Choose Floor"
                activeBuildingRoomArray = mcLeanFloors
            } else {
                activeBuildingRoomArray = westCreekBuildings
            }
        } else {
            if (selectedCampus == "West Creek") {
                navBar.title = "Choose Building"
                activeBuildingRoomArray = westCreekBuildings
            }
            else if (selectedCampus == "Towers") {
                navBar.title = "Choose Floor"
                activeBuildingRoomArray = towersFloors
            }
            else if (selectedCampus == "McLean") {
                navBar.title = "Choose Floor"
                activeBuildingRoomArray = mcLeanFloors
            } else {
                activeBuildingRoomArray = westCreekBuildings
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeBuildingRoomArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // tell it about the LocationTableViewCell.swift file
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationTableViewCell") as! LocationTableViewCell
        
        let buildingFloorName = activeBuildingRoomArray[indexPath.row]
        
        cell.locationTableCellLabel.text = buildingFloorName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! LocationTableViewCell
        
        selectedBuildingFloor = currentCell.locationTableCellLabel.text!
        hasSelectedBuildingFloor = true
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func didTapBackArrow(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
