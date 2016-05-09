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
    var objectIDToPass: String!
    
    var objects: [PFObject]! = [PFObject]()
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.addSubview(self.refreshControl)
        
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let midnightOfToday = cal?.startOfDayForDate(now)
        
        
        let query = PFQuery(className:"Scrap")
        query.orderByDescending("createdAt")
        //query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday!)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            self.objects = objects
            self.tableView.reloadData()
        }

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        let query = PFQuery(className:"Scrap")
        query.orderByDescending("createdAt")
        //query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday!)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            self.objects = objects
            self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let imageFile = objects[indexPath.row]["image"] as? PFFile
        
        if (imageFile != nil) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("HomeTableViewCell") as! HomeTableViewCell
            
            imageFile!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        cell.scrapImage.image = image
                    }
                }
            }
            
            let time = objects[indexPath.row].createdAt!
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            let timeString = dateFormatter.stringFromDate(time)
            
            let title = objects[indexPath.row]["title"] as! String
            let building = objects[indexPath.row]["building"] as! String
            let room = objects[indexPath.row]["room"] as! String
            let feeds = objects[indexPath.row]["feeds"].stringValue
            let description = objects[indexPath.row]["description"] as! String
            let objectID = objects[indexPath.row].objectId
            
            cell.timeLabel.text = timeString
            cell.titleLabel.text = title
            cell.locationLabel.text = "\(building) • \(room)".uppercaseString
            cell.feedsLabel.text = feeds
            cell.descriptionLabel.text = description
            cell.idLabel.text = objectID
            cell.takeScrapButton.tag = indexPath.row
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("HomeNoImageTableViewCell") as! HomeNoImageTableViewCell
            
            let time = objects[indexPath.row].createdAt!
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            let timeString = dateFormatter.stringFromDate(time)
            
            let title = objects[indexPath.row]["title"] as! String
            let building = objects[indexPath.row]["building"] as! String
            let room = objects[indexPath.row]["room"] as! String
            let feeds = objects[indexPath.row]["feeds"].stringValue
            let description = objects[indexPath.row]["description"] as! String
            let objectID = objects[indexPath.row].objectId
            
            cell.timeLabel.text = timeString
            cell.titleLabel.text = title
            cell.locationLabel.text = "\(building) • \(room)".uppercaseString
            cell.feedsLabel.text = feeds
            cell.descriptionLabel.text = description
            cell.idLabel.text = objectID
            cell.takeScrapButton.tag = indexPath.row
            
            return cell
        }
       

    }
    
    
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        let query = PFQuery(className:"Scrap")
        query.orderByDescending("createdAt")
        //query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday!)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            self.objects = objects
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
    }
    
    
    
    
    @IBAction func tappedTakeScrapWithImage(sender: AnyObject) {
        var objectID: String!
        let selectedRowIndex = sender.tag
        let selectedCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: selectedRowIndex, inSection: 0)) as! HomeTableViewCell
        objectID = selectedCell.idLabel.text
        let feeds = selectedCell.feedsLabel.text
        var feedsInt = Int(feeds!)
        feedsInt = feedsInt! - 1
        
        let query = PFQuery(className:"Scrap")
        query.getObjectInBackgroundWithId(objectID) {
            (scrapObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let scrapObject = scrapObject {
                scrapObject["feeds"] = feedsInt
                scrapObject.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) in
                    selectedCell.feedsLabel.text = String(feedsInt!)
                })
            }
        }
        
    }
    
    @IBAction func tappedTakeScrapNoImage(sender: AnyObject) {
        var objectID: String!
        let selectedRowIndex = sender.tag
        let selectedCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: selectedRowIndex, inSection: 0)) as! HomeNoImageTableViewCell
        objectID = selectedCell.idLabel.text
        let feeds = selectedCell.feedsLabel.text
        var feedsInt = Int(feeds!)
        feedsInt = feedsInt! - 1
        
        let query = PFQuery(className:"Scrap")
        query.getObjectInBackgroundWithId(objectID) {
            (scrapObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let scrapObject = scrapObject {
                scrapObject["feeds"] = feedsInt
                scrapObject.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) in
                    selectedCell.feedsLabel.text = String(feedsInt!)
                })
            }
        }
    }
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        
        let imageFile = objects[indexPath.row]["image"] as? PFFile
        
        if (imageFile != nil) {
            let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! HomeTableViewCell
            
            imageToPass = currentCell.scrapImage.image
            timeToPass = currentCell.timeLabel.text
            titleToPass = currentCell.titleLabel.text
            descriptionToPass = currentCell.descriptionLabel.text
            feedsToPass = currentCell.feedsLabel.text
            locationToPass = currentCell.locationLabel.text
            objectIDToPass = currentCell.idLabel.text
            
            self.performSegueWithIdentifier("ShowCellDeets", sender: self)
        } else {
            let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! HomeNoImageTableViewCell
            
            timeToPass = currentCell.timeLabel.text
            titleToPass = currentCell.titleLabel.text
            descriptionToPass = currentCell.descriptionLabel.text
            feedsToPass = currentCell.feedsLabel.text
            locationToPass = currentCell.locationLabel.text
            objectIDToPass = currentCell.idLabel.text
            
            self.performSegueWithIdentifier("NoImageShowCellDeets", sender: self)
        }
        
        
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
            destinationVC.objectIDPassed = objectIDToPass
        } else if (segue.identifier == "NoImageShowCellDeets") {
            let destinationVC = segue.destinationViewController as! DeetsNoImageViewController
            
            destinationVC.timePassed = timeToPass
            destinationVC.titlePassed = titleToPass
            destinationVC.descriptionPassed = descriptionToPass
            destinationVC.feedsPassed = feedsToPass
            destinationVC.locationPassed = locationToPass
            destinationVC.objectIDPassed = objectIDToPass
        }
    }
    
    
}
