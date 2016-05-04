//
//  HomeViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/1/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit
import Parse
import Bolts

class HomeViewController: UIViewController {

    @IBOutlet weak var sampleCard: UIView!
    @IBOutlet weak var sampleImageView: UIImageView!
    @IBOutlet weak var sampleTitle: UILabel!
    @IBOutlet weak var sampleLocation: UILabel!
    @IBOutlet weak var sampleFeedsCounter: UILabel!
    @IBOutlet weak var sampleTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleCard.layer.cornerRadius = 10

        let query = PFQuery(className: "Scrap")
        query.whereKey("title", containsString: "Lego")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        let time = object.createdAt!
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "h:mm a"
                        let timeString = dateFormatter.stringFromDate(time)
                        
                        let title = object["title"] as! String
                        let building = object["building"] as! String
                        let room = object["room"] as! String
                        let feeds = object["feeds"].stringValue
                        
                        let imageFile = object["image"] as? PFFile
                        imageFile!.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                if let imageData = imageData {
                                    let image = UIImage(data:imageData)
                                    self.sampleImageView.image = image
                                }
                            }
                        }
                        
                        self.sampleTitle.text = title
                        self.sampleLocation.text = "\(building) • \(room)"
                        self.sampleFeedsCounter.text = feeds
                        self.sampleTime.text = timeString
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
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
