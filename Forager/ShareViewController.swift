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
    
    @IBOutlet weak var titleLabelTopContraint: NSLayoutConstraint!
    @IBOutlet weak var titleInputTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionInputTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var feedsLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var feedsInputTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationLabelTopConsraint: NSLayoutConstraint!
    @IBOutlet weak var locationButtonTopConstraint: NSLayoutConstraint!
    
    var titleLabelTopConstraintDefault: CGFloat!
    var titleInputTopConstraintDefault: CGFloat!
    var descriptionLabelTopConstraintDefault: CGFloat!
    var descriptionInputTopConstraintDefault: CGFloat!
    var feedsLabelTopConstraintDefault: CGFloat!
    var feedsInputTopConstraintDefault: CGFloat!
    var locationLabelTopConstraintDefault: CGFloat!
    var locationButtonTopConstraintDefault: CGFloat!
    
    var scrapImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabelTopConstraintDefault = titleLabelTopContraint.constant
        titleInputTopConstraintDefault = titleInputTopConstraint.constant
        descriptionLabelTopConstraintDefault = descriptionLabelTopConstraint.constant
        descriptionInputTopConstraintDefault = descriptionInputTopConstraint.constant
        feedsLabelTopConstraintDefault = feedsLabelTopConstraint.constant
        feedsInputTopConstraintDefault = feedsInputTopConstraint.constant
        locationLabelTopConstraintDefault = locationLabelTopConsraint.constant
        locationButtonTopConstraintDefault = locationButtonTopConstraint.constant
        
        titleLabelTopContraint.constant = titleLabelTopConstraintDefault + 10
        descriptionLabelTopConstraint.constant = descriptionLabelTopConstraintDefault + 10
        feedsLabelTopConstraint.constant = feedsLabelTopConstraintDefault + 10
        
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
            locationButtonTopConstraint.constant  = locationButtonTopConstraintDefault + 6
            locationLabel.alpha = 0.25
            view.endEditing(true)
            view.layoutIfNeeded()
        }
    }
    

    @IBAction func titleInputDidChange(sender: UITextField) {
        if titleInput.hasText() {
            UIView.animateWithDuration(0.2, animations: {
                self.titleInputTopConstraint.constant = self.titleInputTopConstraintDefault + 15
                self.titleLabel.alpha = 0.25
                self.titleLabelTopContraint.constant = self.titleLabelTopConstraintDefault
                self.titleSupporter.alpha = 0
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.titleLabel.alpha = 0
                self.titleLabelTopContraint.constant = self.titleLabelTopConstraintDefault + 10
                self.titleInputTopConstraint.constant = self.titleInputTopConstraintDefault
                self.titleSupporter.alpha = 0.25
                self.view.layoutIfNeeded()
            })
        }
    }

    
    
    
    @IBAction func descriptionInputDidChange(sender: UITextField) {
        if descriptionInput.hasText() {
            UIView.animateWithDuration(0.2, animations: {
                self.descriptionInputTopConstraint.constant = self.descriptionInputTopConstraintDefault + 15
                self.descriptionLabel.alpha = 0.25
                self.descriptionLabelTopConstraint.constant = self.descriptionLabelTopConstraintDefault
                self.descriptionSupporter.alpha = 0
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.descriptionLabel.alpha = 0
                self.descriptionLabelTopConstraint.constant = self.descriptionLabelTopConstraintDefault + 10
                self.descriptionInputTopConstraint.constant = self.descriptionInputTopConstraintDefault
                self.descriptionSupporter.alpha = 0.25
                self.view.layoutIfNeeded()
            })
        }
    }

    
    
    
    @IBAction func feedsInputDidChange(sender: AnyObject) {
        if feedsInput.hasText() {
            UIView.animateWithDuration(0.2, animations: {
                self.feedsInputTopConstraint.constant = self.feedsInputTopConstraintDefault + 6
                self.feedsLabel.alpha = 0.25
                self.feedsLabelTopConstraint.constant = self.feedsLabelTopConstraintDefault
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.feedsInputTopConstraint.constant = self.feedsInputTopConstraintDefault
                self.feedsLabel.alpha = 0
                self.feedsLabelTopConstraint.constant = self.feedsLabelTopConstraintDefault + 10
                self.view.layoutIfNeeded()
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
            
            var imageFile: PFFile!
            if (scrapImage != nil) {
                let scale = 1000 / scrapImage.size.width
                let newHeight = scrapImage.size.height * scale
                UIGraphicsBeginImageContext(CGSizeMake(1000, newHeight))
                scrapImage.drawInRect(CGRectMake(0, 0, 1000, newHeight))
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                let imageData = UIImageJPEGRepresentation(newImage, 0.5)
                imageFile = PFFile(name:"image.png", data:imageData!)
                
                scrapObject["image"] = imageFile
            }
            
            scrapObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
                self.dismissViewControllerAnimated(true, completion: { 
                    print("success!")
                })
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
            
            self.scrapImage = info[UIImagePickerControllerOriginalImage] as? UIImage
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
