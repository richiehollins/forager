//
//  ViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 4/28/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.navigationController.navigationBar.titleTextAttributes = NSFontAttributeName[UIFont(name: "GothamRounded-Bold",size:20)!]
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapPull(sender: AnyObject) {
        /*PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
        [query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *gameScore, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", gameScore);
        }];*/
    }
}

