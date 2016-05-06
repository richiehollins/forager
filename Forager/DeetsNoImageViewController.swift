//
//  DeetsNoImageViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/6/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class DeetsNoImageViewController: UIViewController {
    
    var timePassed: String!
    var titlePassed: String!
    var descriptionPassed: String!
    var locationPassed: String!
    var feedsPassed: String!

    @IBOutlet weak var theTitle: UILabel!
    @IBOutlet weak var theDescription: UILabel!
    @IBOutlet weak var theTime: UILabel!
    @IBOutlet weak var theLocation: UILabel!
    @IBOutlet weak var theFeeds: UILabel!
    @IBOutlet weak var theButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theButton.layer.cornerRadius = 10
        
        theTitle.text = titlePassed
        theDescription.text = descriptionPassed
        theTime.text = timePassed
        theLocation.text = locationPassed
        theFeeds.text = "FEEDS \(feedsPassed)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goingBack(sender: AnyObject) {
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
