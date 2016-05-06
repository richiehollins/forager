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

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var imageToPass: UIImage!
    var timeToPass: String!
    var titleToPass: String!
    var descriptionToPass: String!
    var feedsToPass: String!
    var locationToPass: String!
    
    var objects: [PFObject]! = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let midnightOfToday = cal?.startOfDayForDate(now)
        
        
        let query = PFQuery(className:"Scrap")
        query.orderByDescending("createdAt")
        query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            self.objects = objects
            self.tableView.reloadData()
        }

        /*
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
        }*/
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // tell it about the LocationTableViewCell.swift file
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeTableViewCell") as! HomeTableViewCell
        
        let time = objects[indexPath.row].createdAt!
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let timeString = dateFormatter.stringFromDate(time)
        
        let title = objects[indexPath.row]["title"] as! String
        let building = objects[indexPath.row]["building"] as! String
        let room = objects[indexPath.row]["room"] as! String
        let feeds = objects[indexPath.row]["feeds"].stringValue
        let description = objects[indexPath.row]["description"] as! String
        
        let imageFile = objects[indexPath.row]["image"] as? PFFile
        if (imageFile != nil) {
            imageFile!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        cell.scrapImage.image = image
                    }
                }
            }
        } 
        
        
        cell.timeLabel.text = timeString
        cell.titleLabel.text = title
        cell.locationLabel.text = "\(building) • \(room)"
        cell.feedsLabel.text = feeds
        cell.descriptionLabel.text = description
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! HomeTableViewCell
        
        imageToPass = currentCell.scrapImage.image
        timeToPass = currentCell.timeLabel.text
        titleToPass = currentCell.titleLabel.text
        descriptionToPass = currentCell.descriptionLabel.text
        feedsToPass = currentCell.feedsLabel.text
        locationToPass = currentCell.locationLabel.text
        
        self.performSegueWithIdentifier("ShowCellDeets", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowCellDeets") {
            let destinationVC = segue.destinationViewController as! DeetsViewController
            
            destinationVC.imagePassed = imageToPass
            destinationVC.timePassed = timeToPass
            destinationVC.titlePassed = titleToPass
            destinationVC.descriptionPassed = descriptionToPass
            destinationVC.feedsPassed = feedsToPass
            destinationVC.locationPassed = locationToPass
        }
    }
    
    
}
