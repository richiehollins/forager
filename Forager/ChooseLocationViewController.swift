//
//  ChooseLocationViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 8/1/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit
import CoreLocation

class ChooseLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var chooseCampusButton: UIButton!
    @IBOutlet weak var chooseBuildingFloorButton: UIButton!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var roomAreaLabel: UILabel!
    @IBOutlet weak var chooseRoomAreaButton: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hasSelectedBuildingFloor = false
    }

    
    override func viewDidAppear(animated: Bool) {
        if (hasSelectedCampus == true) {
            chooseCampusButton.setTitle("\(selectedCampus)", forState: UIControlState.Normal)
            if selectedCampus == "West Creek" {
                buildingLabel.text = "Building"
                chooseBuildingFloorButton.setTitle("Choose Building", forState: .Normal)
            }
            else if selectedCampus == "Towers" {
                buildingLabel.text = "Floor"
                chooseBuildingFloorButton.setTitle("Choose Floor", forState: .Normal)
            }
            else if selectedCampus == "McLean" {
                buildingLabel.text = "Floor"
                chooseBuildingFloorButton.setTitle("Choose Floor", forState: .Normal)
            } else {
                buildingLabel.text = "Building"
                chooseBuildingFloorButton.setTitle("Choose Building", forState: .Normal)
            }
        } else {
            chooseCampusButton.setTitle("\(detectedLocation)", forState: UIControlState.Normal)
            if detectedLocation == "West Creek" {
                buildingLabel.text = "Building"
                chooseBuildingFloorButton.setTitle("Choose Building", forState: .Normal)
            }
            else if detectedLocation == "Towers" {
                buildingLabel.text = "Floor"
                chooseBuildingFloorButton.setTitle("Choose Floor", forState: .Normal)
            }
            else if detectedLocation == "McLean" {
                buildingLabel.text = "Floor"
                chooseBuildingFloorButton.setTitle("Choose Floor", forState: .Normal)
            } else {
                buildingLabel.text = "Building"
                chooseBuildingFloorButton.setTitle("Choose Building", forState: .Normal)
            }
        }
        
        if (hasSelectedBuildingFloor == true) {
            chooseBuildingFloorButton.setTitle(selectedBuildingFloor, forState: .Normal)
        } else {
            //
        }
    }

    @IBAction func didTapBackArrow(sender: AnyObject) {
        selectedRoom = chooseRoomAreaButton.text!
        navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
