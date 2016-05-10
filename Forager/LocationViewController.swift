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
    
    @IBOutlet weak var wc1Button: UIButton!
    @IBOutlet weak var wc2Button: UIButton!
    @IBOutlet weak var wc3Button: UIButton!
    @IBOutlet weak var wc4Button: UIButton!
    @IBOutlet weak var wc5Button: UIButton!
    @IBOutlet weak var wc6Button: UIButton!
    @IBOutlet weak var wc7Button: UIButton!
    @IBOutlet weak var wc8Button: UIButton!
    
    var wc1Rooms: [String]!
    var wc2Rooms: [String]!
    var wc3Rooms: [String]!
    var wc4Rooms: [String]!
    var wc5Rooms: [String]!
    var wc6Rooms: [String]!
    var wc7Rooms: [String]!
    var wc8Rooms: [String]!
    var activeBuildingRoomArray: [String]!
    
    
    @IBOutlet weak var activeLocationLeftMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildingScroller.contentSize = CGSize(width: 480, height: 40)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        wc1Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1110","1111","1112","1113","1118","1120","1125","1127","1128","1129","1130","1132","1135","1136","1137","1138","1139","1141","1142","1143","1145","1150","1151","2101","2102","2103","2104","2105","2113","2117","2118","2125","2127","2128","2130","2135","2136","2137","2138","2139","2140","2141","2142","2143","2150","2151","2158","2159","2170","2171","2172","2180","2181","3111","3117","3118","3119","3125","3126","3127","3128","3130","3135","3136","3137","3138","3139","3140","3141","3142","3143","3150","3151","3158","3159","3170","3171","3172","4111","4117","4118","4119","4125","4127","4132","4133","4135","4136","4137","4138","4139","4140","4141","4142","4143","4147","4150","4151","4158","4170","4171","4172","4180","4181"]
        wc2Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1101: Black Sea","1104: Po River","1105: Ural","1109: Peyto Lake","1110: Pyramid Lake","1112: Solomon Sea","1113: Geauga Lake","1115: Lake Calhoun","1128: Pacific Video","1129: Red Sea","1131: Standard","1132: Standard","1133: Standard","1165: Atlantic Ocean","1166: Arctic Ocean","1179: Arabian Sea","1180: Sea of Japan","1181: Caspian Sea","1182: Gulf of Mexico","1183: Mediterranean","2101: Volga","2102: Ob-Irtysh","2104: Amazon","2105: York River","2108: Goose Creek","2109: Gamtoos River","2110: Mania","2112A: Santee","2112B: Ganges","2113: Thames","2115: James","2127: Nile","2128: Panama Canal","2129: Yangtze","2130: Maury River","2132: Gambia","2133: Mississippi","2145: Sandy River","2151: Shooting Creek","2153: Groundhog River","2159: Gunnison River","2176: Hull Creek","2177: Lena","2178: Santa Cruz","2180: Swift Mill Creek","2181: Hungary Creek","2183: Fires Creek","2184: Swan River","2185: Bear Creek","2186: New River","3101: Crater","3102: Lake Superior","3103: Nyasa","3104: Molopo","3105: Swakop","3107: Shangani","3108: Jubba","3110: Tangangika","3111: Lake Loure","3112: Limpopo","3113: Marion","3114: Keokee Lake","3127: Ontario","3129: Huron","3130: Lake Victoria","3131: Painted Rock","3132: Walker Lake","3133: Lake Michigan","3134: Didessa","3135: Mountain Lake","3145: Deer Lake","3151: Baffin Bay","3152: Hiawassee","3153: Chatuge","3154: Biwa Lake","3156: Lake St. Clair","3157: Rainy Lake","3175: Chesapeake","3176: Lake Jackson","3177: Mallet's Bay","3179: Lake Champlain","3180: Hudson Bay","3181: Boiling Lake","3182: Yosemite","3183: Winnipeg","3185: Lake Chesdin","4103: Maldives","4104: Whiteoak Falls","4105: Crescent Falls","4108: Wah Way Creek","4109: Trigalong Creek","4110: Wallamba","4112: Raven Rock Falls","4113: Emperor Reef","4114: Cheshire Creek","4115: Sandusky Bay","4129: Niagara Falls","4133: Angel Falls","4151: Iguassu","4152: Columbia Falls","4153: Toxaway Falls","4154: Pinchgut Creek","4156: Buffalo Creek","4157: Butterfly Falls","4159: Lava Creek","4179: Dawn Falls","4180: Barron Falls","4181: Pandora Reef","4182: Hunting Creek","4183: Lighthouse Reef","4184: Glovers Reef","4185: Linville Falls"]
        wc3Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1102: Volcano","1104: Landslide","1105: Windstorm","1106: Standard Conference Room","1107: Hurricane","1109: Lightning","1111: Monsoon","1112: Typhoon","1126: Cyclone","1129: Radar","1130: Hotel Enclave","1131: Hotel Enclave","1133: Tsunami","1135: Earthquake","1136: Surge","1137: Snowball","1153: Tidal Wave","1154: Thunder Storm","1156","1161: Rain","1162: Drought","1163: Eclipse","1164","1165: Standard Conference Room","1166: Standard Conference Room","1177: Heatwave","2102: Red Square","2103: Silk Road","2104: Arch of Triumph","2105: Centralia","2106: Standard Conference Room","2107: Standard Conference Room","2109: Sphinx","2110: Acropolis","2111: St. Louis Arch","2112: Stone Town","2126: Mission Bay","2127: Standard Conference Room","2128: Standard Conference Room","2129: Cliff Palace","2130: Hotel Enclave","2131: Hotel Enclave","2132: Standard Conference Room","2133: Monument Valley","2134: Standard Conference Room","2135: Roman Forum","2136: Taxco","2137: Petra","2138: Easter Island","2151: Forbidden City","2152: Flaming Cliffs","2153: Prospect Park","2154: Gates of Understanding","2155: Great Wall of China","2156: Ayers Rock","2157: Coliseum","2159: Deep Sea Vents","2160: Belfast Castle","2162: Bora Bora","2176: Taj Mahal","2178: War Room","2179: Casa Mila","2180: Hotel Enclave","2181: Hotel Enclave","2182: Cappadocia","2183: Standard Conference Room","3103: Death Valley","3109: Everglades","3110: Biscayne","3111: Himalayas","3112: Whetstone","3126: Informal Conference Room","3127: Grand Canyon","3128: Big Bend","3129: Patagonia","3130: Hotel Enclave","3131: Hotel Enclave","3132: Rocky Mountains","3133: Ozark","3134: Yellowstone","3136: Guadalupe","3137: Badlands","3138: Mesa Verde","3153: Yosemite","3154: Shenandoah","3157: Pinnacles","3158: Saguaro","3162: Bighorn Canyon","3163: Mt. Rushmore","3164: Elsinore","3165: Voyageurs","3166: Joshua Tree","3169: Wind Cave","3176: Adirondack","3177: Mt. Rainier","3178: Chief Of Staff","3179: Westminster Abbey","3180: Isle Royale","3181: AMLFile Room","3183: Andes","4102: Ruby","4103: Tanzanite","4104: Malachite","4106","4107: Opal","4108: Diamond","4109: Cat's Eye","4110: Amber","4111: Topaz","4126: Amethyst","4127: Aquamarine","4128: Feldspar","4129: Black Diamond","4130: Rose Quartz","4131: Geode","4133: Investigations - Beryl","4135: Emerald","4136: Onyx","4137: Peridot","4138: Zircon","4176: Sapphire","4178: Eorms","4179: Garnet","4180: Pearl","4181: Alexandrite"]
        wc4Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1110","1111","1112","1113","1128","1132","1133","1134","1136","1137","1138","1140","1141B","1146","1148","1150","1151","1158","1160","2110","2111","2112","2113","2127","2128","2130","2132","2133","2134","2135","2136","2137","2138","2140","2142","2144C","2145","2146","2148","2150","2153","2158","3110","3111","3112","3113","3127","3128","3132","3133","3134","3135","3136","3137","3138","3140","3142","3143","3144C","3145","3146","3148","3150","3153","3158","3160","4128","4132","4133","4134","4135","4136","4137","4140","4142","4144C","4145","4146","4147","4148","4150","4153","4154","4160"]
        wc5Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1110","1111","1112","1125","1126","1127","1130","1131","1132","1134","1135","1140","1145","1147","1148","1149","1157","1160","1161","1162","2110","2111","2112","2125","2126","2127","2128","2129","2130","2131","2132","2133","2134","2135","2140","2142","2147","2148","2149","2150","2151","2155","2156","2159","2160","2161","3110","3111","3112","3125","3126","3127","3128","3129","3130","3131","3132","3133","3134","3135","3140","3147","3149","3150","3151","3155","3156","3159","3160","3161","4110","4111","4112","4125","4126","4127","4128","4129","4130","4131","4132","4133","4134","4135","4147","4148","4149","4155","4156","4159","4160","4161"]
        wc6Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1101A: Shoreline","1101B: Brushlands","1102: Forest","1103: Mountain","1104: Pasture","1105: Pond","1106: Coastline","1108: Desert","1110: Ocean","1119: Quicksand","1120: Marshlands","1121: The Bayou","1122: Lake","1123: Prairie","1124: Tropics","1125: Canyon","1126: Glacier","1127: Cave","1128: Field","1129: Swamp","1150: Woodlands","1151: Cavern","1152: Dune","1155: Meadow","1159: Stream","1161: Valley","1163: Tundra","1166: River","2102: Neon","2103: Nitrogen","2104: Carnelian","2105: Argon","2107B: Bromine","2107C: Galena","2107D: Borax","2109: Quartz","2114: Brass","2119: Nickel","2120: Zinc","2125: Jasper","2127: Copper","2128: Diopside","2130: Hotel Enclave","2131: Nephrite","2132: Hotel Enclave","2134: Aluminum","2135: Helium","2136: Xenon","2137: Sulfur","2138: Carbon","2139: Electroid","2141: Hotel Enclave","2142: Hotel Enclave","2143: Cobalt","2157: Citrine","3102: Holly","3103: Mulberry","3105: White Oak","3107B: Basswood","3107C: Red Alder","3107D: Sassafras","3108: Chestnut","3111: LifeStyles","3112: Dove Tree","3114: Standard Conference Room","3119: Birch","3120: Elm","3121: Dogwood","3122: Standard Conference Room","3123: Red Maple","3124: Pine","3125: Cedar","3134: Sycamore","3136: Crape-Myrtle","3137: Cottonwood","3138: Cypress","3139: Hickory","3141: Hotel Enclave","3142: Hotel Enclave","3143: Buckeye","3155: Sweet Gum","3157: Standard Conference Room","4102: Cheetah","4103: Ermine","4104: Aardvark","4105: Jackrabbit","4106: Koala Bear","4107B: Badger","4107C: Baboon","4107D: Gecko","4108: Giant Panda","4109: Polar Bear","4110: Rhinoceros","4111: Bison","4112: Eland","4113: Grizzly Bear","4114: Bald Eagle","4119: Leopard","4120: Tiger","4121: Otter","4122: Manatee","4123: African Elephant","4124: Camel","4125: Tamari","4130C: Zebra","4134: Duiker","4135: Impala","4136: Bobcat","4137: Ostrich","4138: Gemsbok","4139: Elk","4141: Hotel Enclave","4142: Hotel Enclave","4143: Blue Whale","4150: Antelope","4151: Kudu","4152: Buzzard","4155: Wildebeest","4157: Gazelle"]
        wc7Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1103: Tadpole","1104: Land Shark","1105: Sea Serpent","1109: Neptune","1110: Lionfish","1111: Parrotfish","1112: Minnow","1126: Mussel","1127: Man-O-War","1130: Hotel Enclave","1131: Hotel Enclave","1132: Largemouth Bass","1133A: Nagfish","1134: Clownfish","1135: Manta Ray","1136: Mermaid","1137: Globefish","1151: Salmon","1154: Squirrelfish","1155: Eagle Ray","1158: Catfish","1159: Flying Fish","1160: Goldfish","1162: Tartar Sauce","2103N","2103O","2103P","2103Q","2103R","2105: Spearfish","2110: Plankton","2152","2170","2171: Hotel Office","2172","2201: Disaster Recovery Room","2203: Wolffish","2205: Barnacle","2206: Coral","2211","2303: Hotel Office","2304: Trout","2401: Sturgeon","2427: Mackerel","3102: Anemone","3105: Great White","3107: Herring","3108: Angelfish","3109: Proteus","3111: Butterflyfish","3112: Sunfish","3126: Sanddollar","3127: Sand Flea","3128: Scallop","3130: Hotel Enclave","3131: Hotel Enclave","3132: Hammer Head","3133: Blow Fish","3134: Kingfish","3135: Stingray","3136: Glassfish","3138: Moray Eel","3139: Bluefish","3152: Conch","3153: Starfish","3156: Sponge","3157: Red Snapper","3163: Horseshoe Crab","3164: Amberjack","3176: Dolphin","3180: King Crab","3181: Hermit Crab","3183: Sea Urchin","3190","3195: Big Fish","3196: Alligator","3197: Crocodile","4102 Orca","4103: Pufferfish","4104: Cuttlefish","4105: Standard Conference Room","4106: Albatross","4108: Hotel Office","4109: Poseidon","4110: Manatee","4111: Seal","4112: Porpoise","4126: Jellyfish","4127: Walrus","4128: Sea Mouse","4130: Hotel Enclave","4131: Hotel Enclave","4132: Prawn","4134 Barracuda","4135: Penguin","4136: Coelacanth","4137: Sea Bass","4139: Blue Tang","4152: Lobster","4153: Sea Horse","4156: Walleye","4158: Tilapia","4159: Sea Otter","4160: Damselfish","4161","4163: Grass Carp","4176: Sea Lion","4177: Amoeba","4179: Seahawks","4180: Sea Bream","4181: Monkfish","4186: Sea Dragon","4187: Mollusk","4188: Skate","4191: Dogfish"]
        wc8Rooms = ["1st Floor Galley","2nd Floor Galley","3rd Floor Galley","4th Floor Galley","1110","1118","1120","1122","1124","1128","1158","1164","1172","1174","1178","1180","1182","1184","1185","1187","1188","1189","1190","1191","1192","1193","1194","1195","1196","1197","2001: Mother's Room","2100","2104","2106","2108","2110","2118","2120","2124","2128","2130: Presentation Room","2132: Video Conference Room","2134","2136","2142","2148","2152","2156","2158","2160","2162","2164","2166","2168","2172","2176","2178","2180","2182","2192","2194","2196","2197","2198","2199","3001: Mother's Room","3100","3102","3104","3106","3108","3110","3116","3118","3120","3122","3126","3128","3130: Presentation Room","3132: Video Conference Room","3134","3136","3142","3144","3154","3156","3158","3160","3164","3166","3168","3172","3174","3176","3178","3180","3182","3192","3194","3199","4001: Mother's Room","4102","4106","4116","4118","4122","4128","4130: Presentation Room","4132","4134","4142","4154","4156","4158","4160","4164","4172","4176","4192","4199"]
        
        activeBuildingRoomArray = wc1Rooms
        
        if selectedBuilding == "" {
            selectedBuilding = "WC1"
        }
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        if (selectedBuilding == "WC1") {
            UIView.animateWithDuration(0.3, animations: { 
                self.activeLocationIndicator.frame.origin.x = self.wc1Button.frame.origin.x
            })
            activeBuildingRoomArray = wc1Rooms
        } else if (selectedBuilding == "WC2") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc2Button.frame.origin.x
            })
            activeBuildingRoomArray = wc2Rooms
        } else if (selectedBuilding == "WC3") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc3Button.frame.origin.x
            })
            activeBuildingRoomArray = wc3Rooms
        } else if (selectedBuilding == "WC4") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc4Button.frame.origin.x
            })
            activeBuildingRoomArray = wc4Rooms
        } else if (selectedBuilding == "WC5") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc5Button.frame.origin.x
            })
            activeBuildingRoomArray = wc5Rooms
        } else if (selectedBuilding == "WC6") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc6Button.frame.origin.x
                self.buildingScroller.contentOffset.x = self.wc6Button.frame.origin.x - 200
            })
            activeBuildingRoomArray = wc6Rooms
        } else if (selectedBuilding == "WC7") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc7Button.frame.origin.x
                self.buildingScroller.contentOffset.x = self.wc7Button.frame.origin.x - 200
            })
            activeBuildingRoomArray = wc7Rooms
        } else if (selectedBuilding == "WC8") {
            UIView.animateWithDuration(0.3, animations: {
                self.activeLocationIndicator.frame.origin.x = self.wc8Button.frame.origin.x
                self.buildingScroller.contentOffset.x = self.wc8Button.frame.origin.x - 200
            })
            activeBuildingRoomArray = wc8Rooms
        }
        tableView.reloadData()
    }


    
    
    @IBAction func didChangeLocation(sender: AnyObject) {
        UIView.animateWithDuration(0.3) {
            self.activeLocationIndicator.frame.origin.x = sender.frame.origin.x
            //self.activeLocationLeftMargin.constant = sender.frame.origin.x
            //self.buildingScroller.layoutIfNeeded()
        }
        if ( sender.tag == 1 ) {
            activeBuildingRoomArray = wc1Rooms
            selectedBuilding = "WC1"
        } else if ( sender.tag == 2 ) {
            activeBuildingRoomArray = wc2Rooms
            selectedBuilding = "WC2"
        } else if ( sender.tag == 3 ) {
            activeBuildingRoomArray = wc3Rooms
            selectedBuilding = "WC3"
        } else if ( sender.tag == 4 ) {
            activeBuildingRoomArray = wc4Rooms
            selectedBuilding = "WC4"
        } else if ( sender.tag == 5 ) {
            activeBuildingRoomArray = wc5Rooms
            selectedBuilding = "WC5"
        } else if ( sender.tag == 6) {
            activeBuildingRoomArray = wc6Rooms
            selectedBuilding = "WC6"
        } else if ( sender.tag == 7 ) {
            activeBuildingRoomArray = wc7Rooms
            selectedBuilding = "WC7"
        } else if ( sender.tag == 8) {
            activeBuildingRoomArray = wc8Rooms
            selectedBuilding = "WC8"
        }
        tableView.reloadData()
        
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
        
        selectedRoom = currentCell.locationTableCellLabel.text!
        hasSelectedRoom = true
        navigationController?.popViewControllerAnimated(true)
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


}
