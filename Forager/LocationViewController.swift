//
//  LocationViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/1/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var buildingScroller: UIScrollView!
    @IBOutlet weak var activeLocationIndicator: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var wc6Rooms: [String]!
    var wc8Rooms: [String]!
    var activeBuildingRoomArray: [String]!
    
    var theSelectedRoom: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildingScroller.contentSize = CGSize(width: 480, height: 40)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        wc6Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1101A: Shoreline","1101B: Brushlands","1102: Forest","1103: Mountain","1104: Pasture","1105: Pond","1106: Coastline","1108: Desert","1110: Ocean","1119: Quicksand","1120: Marshlands","1121: The Bayou","1122: Lake","1123: Prairie","1124: Tropics","1125: Canyon","1126: Glacier","1127: Cave","1128: Field","1129: Swamp","1150: Woodlands","1151: Cavern","1152: Dune","1155: Meadow","1159: Stream","1161: Valley","1163: Tundra","1166: River","2102: Neon","2103: Nitrogen","2104: Carnelian","2105: Argon","2107B: Bromine","2107C: Galena","2107D: Borax","2109: Quartz","2114: Brass","2119: Nickel","2120: Zinc","2125: Jasper","2127: Copper","2128: Diopside","2130: Hotel Enclave","2131: Nephrite","2132: Hotel Enclave","2134: Aluminum","2135: Helium","2136: Xenon","2137: Sulfur","2138: Carbon","2139: Electroid","2141: Hotel Enclave","2142: Hotel Enclave","2143: Cobalt","2157: Citrine","3102: Holly","3103: Mulberry","3105: White Oak","3107B: Basswood","3107C: Red Alder","3107D: Sassafras","3108: Chestnut","3111: LifeStyles","3112: Dove Tree","3114: Standard Conference Room","3119: Birch","3120: Elm","3121: Dogwood","3122: Standard Conference Room","3123: Red Maple","3124: Pine","3125: Cedar","3134: Sycamore","3136: Crape-Myrtle","3137: Cottonwood","3138: Cypress","3139: Hickory","3141: Hotel Enclave","3142: Hotel Enclave","3143: Buckeye","3155: Sweet Gum","3157: Standard Conference Room","4102: Cheetah","4103: Ermine","4104: Aardvark","4105: Jackrabbit","4106: Koala Bear","4107B: Badger","4107C: Baboon","4107D: Gecko","4108: Giant Panda","4109: Polar Bear","4110: Rhinoceros","4111: Bison","4112: Eland","4113: Grizzly Bear","4114: Bald Eagle","4119: Leopard","4120: Tiger","4121: Otter","4122: Manatee","4123: African Elephant","4124: Camel","4125: Tamari","4130C: Zebra","4134: Duiker","4135: Impala","4136: Bobcat","4137: Ostrich","4138: Gemsbok","4139: Elk","4141: Hotel Enclave","4142: Hotel Enclave","4143: Blue Whale","4150: Antelope","4151: Kudu","4152: Buzzard","4155: Wildebeest","4157: Gazelle"]
        wc8Rooms = ["1110","1118","1120","1122","1124","1128","1158","1164","1172","1174","1178","1180","1182","1184","1185","1187","1188","1189","1190","1191","1192","1193","1194","1195","1196","1197","2001: Mother's Room","2100","2104","2106","2108","2110","2118","2120","2124","2128","2130: Presentation Room","2132: Video Conference Room","2134","2136","2142","2148","2152","2156","2158","2160","2162","2164","2166","2168","2172","2176","2178","2180","2182","2192","2194","2196","2197","2198","2199","3001: Mother's Room","3100","3102","3104","3106","3108","3110","3116","3118","3120","3122","3126","3128","3130: Presentation Room","3132: Video Conference Room","3134","3136","3142","3144","3154","3156","3158","3160","3164","3166","3168","3172","3174","3176","3178","3180","3182","3192","3194","3199","4001: Mother's Room","4102","4106","4116","4118","4122","4128","4130: Presentation Room","4132","4134","4142","4154","4156","4158","4160","4164","4172","4176","4192","4199"]
        
        activeBuildingRoomArray = wc6Rooms
    }


    
    
    @IBAction func didChangeLocation(sender: AnyObject) {
        UIView.animateWithDuration(0.3) {
            self.activeLocationIndicator.frame.origin.x = sender.frame.origin.x
        }
        if (sender.tag == 6 ) {
            activeBuildingRoomArray = wc6Rooms
        } else if (sender.tag == 8) {
            activeBuildingRoomArray = wc8Rooms
        }
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeBuildingRoomArray.count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // tell it about the LocationTableViewCell.swift file      
        let cell = tableView.dequeueReusableCellWithIdentifier("LocationTableViewCell") as! LocationTableViewCell
        
        let locationName = activeBuildingRoomArray[indexPath.row]
        
        cell.locationTableCellLabel.text = locationName
        
        return cell
    }

    
    
    @IBAction func tappedBackArrow(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! LocationTableViewCell
        
        theSelectedRoom = currentCell.locationTableCellLabel.text!
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as! ShareViewController
        //nextViewController.locationButton.titleLabel = theSelectedRoom
        nextViewController.locationButton.setTitle(theSelectedRoom, forState: UIControlState.Normal)
        nextViewController.titleLabel.resignFirstResponder()
        
    }


}
