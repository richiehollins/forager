//
//  DeetsViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/5/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit
import Parse
import Bolts

class DeetsViewController: UIViewController {
    
    var imagePassed: UIImage!
    var timePassed: String!
    var titlePassed: String!
    var descriptionPassed: String!
    var locationPassed: String!
    var feedsPassed: String!
    var feedsPassedInt: Int!
    var objectIDPassed: String!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var theDescription: UILabel!
    @IBOutlet weak var theTime: UILabel!
    @IBOutlet weak var theLocation: UILabel!
    @IBOutlet weak var theFeeds: UILabel!
    @IBOutlet weak var theButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theButton.layer.cornerRadius = 10

        imageView.image = imagePassed
        theTitle.text = titlePassed
        theDescription.text = descriptionPassed
        theTime.text = timePassed
        theLocation.text = locationPassed
        theFeeds.text = "FEEDS \(feedsPassed)"
        feedsPassedInt = Int(feedsPassed)
    }


    
    @IBAction func tappedBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    
    @IBAction func tappedTakeScrap(sender: AnyObject) {
        feedsPassedInt = feedsPassedInt - 1
        feedsPassed = String(feedsPassedInt)
        
        if feedsPassedInt == 0 {
            self.theFeeds.text = "FEEDS \(self.feedsPassed)"
            let query = PFQuery(className:"Scrap")
            query.getObjectInBackgroundWithId(objectIDPassed) {
                (scrapObject: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let scrapObject = scrapObject {
                    scrapObject.deleteInBackgroundWithBlock({ (success:Bool, error:NSError?) in
                        self.navigationController?.popViewControllerAnimated(true)
                    })
                }
            }
        } else {
            let query = PFQuery(className:"Scrap")
            query.getObjectInBackgroundWithId(objectIDPassed) {
                (scrapObject: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let scrapObject = scrapObject {
                    scrapObject["feeds"] = self.feedsPassedInt
                    scrapObject.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) in
                        self.theFeeds.text = "FEEDS \(self.feedsPassed)"
                    })
                }
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
