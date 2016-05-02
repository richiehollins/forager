//
//  LocationViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/1/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var buildingScroller: UIScrollView!
    @IBOutlet weak var activeLocationIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildingScroller.contentSize = CGSize(width: 480, height: 40)
//        self.automaticallyAdjustsScrollViewInsets = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChangeLocation(sender: AnyObject) {
        /*UIView.animateWithDuration(0.3) {
            self.activeLocationIndicator.frame.origin.x = sender.frame.origin.x
        }*/
        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: {
            self.activeLocationIndicator.frame.origin.x = sender.frame.origin.x
            print("sender: \(sender.frame.origin.x)")
            print("activelocation: \(self.activeLocationIndicator.frame.origin.x)")
//             self.activeLocationIndicator.translatesAutoresizingMaskIntoConstraints=true
            // this is giving lots of warnings.
            }) { (Bool) in
                
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
