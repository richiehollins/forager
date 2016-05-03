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

var selectedRoom: String!
var selectedBuilding: String!
var hasSelectedRoom: Bool!

class ShareViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var photoPreview: UIImageView!
    @IBOutlet weak var deletePhotoButton: UIButton!
    
    var titleLabelOrigin: CGPoint!
    var titleInputOrigin: CGPoint!
    var descriptionLabelOrigin: CGPoint!
    var descriptionInputOrigin: CGPoint!
    var feedsLabelOrigin: CGPoint!
    var feedsInputOrigin: CGPoint!
    var locationButtonOrigin: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabelOrigin = titleLabel.frame.origin
        titleInputOrigin = titleInput.frame.origin
        descriptionLabelOrigin = descriptionLabel.frame.origin
        descriptionInputOrigin = descriptionInput.frame.origin
        feedsLabelOrigin = feedsLabel.frame.origin
        feedsInputOrigin = feedsInput.frame.origin
        locationButtonOrigin = locationButton.frame.origin
        
        titleLabel.frame.origin.y = titleLabelOrigin.y + 10
        descriptionLabel.frame.origin.y = descriptionLabelOrigin.y + 10
        feedsLabel.frame.origin.y = feedsLabelOrigin.y + 10
        
        titleInput.becomeFirstResponder()
        
        selectedRoom = ""
        selectedBuilding = ""
        hasSelectedRoom = false
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if (selectedRoom == "") {
            locationButton.setTitle("Location?", forState: UIControlState.Normal)
        } else {
            locationButton.setTitle("\(selectedBuilding) • \(selectedRoom)", forState: UIControlState.Normal)
            locationButton.alpha = 1
            locationButton.frame.origin.y = locationButtonOrigin.y + 6
            locationLabel.alpha = 0.25
            view.endEditing(true)
        }
    }
    

    @IBAction func titleInputDidChange(sender: UITextField) {
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
                self.descriptionInput.frame.origin.y = self.descriptionInputOrigin.y
                self.descriptionSupporter.alpha = 0.25
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
                self.feedsInput.frame.origin.y = self.feedsInputOrigin.y
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
        if (titleInput.hasText() && feedsInput.hasText() && hasSelectedRoom==true) {
            let scrapObject = PFObject(className: "Scrap")
            scrapObject["title"] = titleInput.text
            scrapObject["description"] = descriptionInput.text
            scrapObject["feeds"] = Int(feedsInput.text!)
            scrapObject["building"] = selectedBuilding
            scrapObject["room"] = selectedRoom
            scrapObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
            }
        } else {
            showErrorAlert()
        }
    }
    
    
    
    @IBAction func tappedAddPhoto(sender: AnyObject) {
        view.endEditing(true)
        showAddPhotoActionSheet()
    }
    
    
    func showAddPhotoActionSheet() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in }
        let takeNewAction = UIAlertAction(title: "Take New", style: .Default) { (action) in
            let camera = UIImagePickerController()
            camera.delegate = self
            camera.sourceType = .Camera
            
            self.presentViewController(camera, animated: true, completion: nil)
        }
        let useExistingAction = UIAlertAction(title: "Use Existing", style: .Default) { (action) in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .PhotoLibrary
            
            self.presentViewController(picker, animated: true, completion: nil)
            picker.navigationBar.translucent = false
            picker.navigationBar.backgroundColor = UIColor(red: 68/255, green: 189/255, blue: 236/255, alpha: 1.0)
            picker.navigationBar.barTintColor = UIColor(red: 68/255, green: 189/255, blue: 236/255, alpha: 1.0)
            picker.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(takeNewAction)
        alertController.addAction(useExistingAction)
        
        presentViewController(alertController, animated: true) { 
            // what to do once it's been presented
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        photoPreview.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(true) { 
            self.photoPreview.alpha = 1
            self.addPhotoButton.alpha = 0
            self.photoLabel.alpha = 0.25
            self.deletePhotoButton.alpha = 1
        }
    }
    
    
    
    @IBAction func tappedTrashIcon(sender: AnyObject) {
        photoPreview.image = nil
        photoPreview.alpha = 0
        deletePhotoButton.alpha = 0
        photoLabel.alpha = 0
        addPhotoButton.alpha = 1
    }
    
    
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Slow down there, Sparky.", message: "Can't share a scrap until you've at least added a title, location, and how many folks it will feed.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Alrighty", style: .Cancel) { (action) in
            self.titleInput.isFirstResponder()
        }
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
