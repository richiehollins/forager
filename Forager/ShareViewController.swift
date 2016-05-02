//
//  ShareViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/1/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ShareViewController: UIViewController {

    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleSupporter: UILabel!
    @IBOutlet weak var titleInput: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionSupporter: UILabel!
    @IBOutlet weak var descriptionInput: UITextField!
    
    @IBOutlet weak var feedsLabel: UILabel!
    @IBOutlet weak var feedsInput: UITextField!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    
    var titleLabelOrigin: CGPoint!
    var titleInputOrigin: CGPoint!
    var descriptionLabelOrigin: CGPoint!
    var descriptionInputOrigin: CGPoint!
    var feedsLabelOrigin: CGPoint!
    var feedsInputOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabelOrigin = titleLabel.frame.origin
        titleInputOrigin = titleInput.frame.origin
        print("titleInputOrigin at start: \(titleInputOrigin)")
        descriptionLabelOrigin = descriptionLabel.frame.origin
        descriptionInputOrigin = descriptionInput.frame.origin
        feedsLabelOrigin = feedsLabel.frame.origin
        feedsInputOrigin = feedsInput.frame.origin
        
        titleLabel.frame.origin.y = titleLabelOrigin.y + 10
        descriptionLabel.frame.origin.y = descriptionLabelOrigin.y + 10
        feedsLabel.frame.origin.y = feedsLabelOrigin.y + 10
        
        titleInput.becomeFirstResponder()
    }

    @IBAction func titleInputDidChange(sender: UITextField) {
        print("titleinput change: \(self.titleInput.frame.origin.y)")

        if titleInput.hasText() {
            UIView.animateWithDuration(0.2, animations: {
                self.titleInput.frame.origin.y = self.titleInputOrigin.y + 15
                self.titleLabel.alpha = 0.25
                self.titleLabel.frame.origin.y = self.titleLabelOrigin.y
                self.titleSupporter.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.frame.origin.y = self.titleLabelOrigin.y + 10
            })
        }
    }
    
    @IBAction func titleInputEditingDidEnd(sender: UITextField) {
        print("titleinput: \(self.titleInput.frame.origin.y)")
        if titleInput.hasText() {
            UIView.animateWithDuration(0.2, animations: { 
                self.titleInput.frame.origin.y = self.titleInputOrigin.y + 145
                print("titleinput after hastext: \(self.titleInput.frame.origin.y)")

            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.titleLabel.alpha = 0
                self.titleInput.frame.origin.y = self.titleInputOrigin.y
                self.titleSupporter.alpha = 0.25
            })
        }
    }
    
    
    @IBAction func descriptionInputDidChange(sender: UITextField) {
        if descriptionInput.hasText() {
            UIView.animateWithDuration(0.2, animations: {
                self.descriptionInput.frame.origin.y = self.descriptionInputOrigin.y + 15
                self.descriptionLabel.alpha = 0.25
                self.descriptionLabel.frame.origin.y = self.descriptionLabelOrigin.y
                self.descriptionSupporter.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.descriptionLabel.alpha = 0
                self.descriptionLabel.frame.origin.y = self.descriptionLabelOrigin.y + 10
            })
        }
    }

    @IBAction func feedsInputDidChange(sender: AnyObject) {
        if feedsInput.hasText() {
            UIView.animateWithDuration(0.2, animations: { 
                self.feedsInput.frame.origin.y = self.feedsInputOrigin.y + 6
                self.feedsLabel.alpha = 0.25
                self.feedsLabel.frame.origin.y = self.feedsLabelOrigin.y
            })
        } else {
            UIView.animateWithDuration(0.2, animations: { 
                self.feedsLabel.alpha = 0
                self.feedsLabel.frame.origin.y = self.feedsLabelOrigin.y + 10
            })
        }
    }
    
    
    
    @IBAction func tappedView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func tappedX(sender: AnyObject) {
        view.endEditing(true)
        self.dismissViewControllerAnimated(true) {
            
        }
    }
    
    
    
    @IBAction func tappedCheck(sender: AnyObject) {
        let scrapObject = PFObject(className: "Scrap")
        scrapObject["title"] = titleInput.text
        scrapObject["description"] = descriptionInput.text
        scrapObject["feeds"] = Int(feedsInput.text!)
        scrapObject["building"] = "WC5"
        scrapObject["room"] = "1101: Room"
        scrapObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
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
