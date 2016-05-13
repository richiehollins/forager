//
//  FirstTimeUXViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/13/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class FirstTimeUXViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var masterScrollView: UIScrollView!
    @IBOutlet weak var paginationDots: UIPageControl!
    @IBOutlet weak var fourthScreen: UIView!
    @IBOutlet weak var theButton: UIButton!
    
    var timesYouveScrolledToPage4: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        masterScrollView.contentSize = CGSize(width: view.frame.size.width * 4, height: view.frame.size.height)
        masterScrollView.delegate = self
        
        theButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = view.frame.size.width
        let page : Int = Int(round(scrollView.contentOffset.x / pageWidth))
        paginationDots.currentPage = page
        
        if page == 3 {
            paginationDots.hidden = true
            if timesYouveScrolledToPage4 < 1 {
                throwAllTheFoods()
            }
            timesYouveScrolledToPage4 += 1
        } else {
            paginationDots.hidden = false
        }
    }
    
    func throwAllTheFoods() {
        throwFood("orange", width: 34, height: 41, x: 0.93, y: -200, rotation: 200, delay: 0.5, speed: 3.25)
        throwFood("taco", width: 78, height: 32, x: 0.05, y: -132, rotation: 45, delay: 3.0, speed: 3)
        throwFood("pizza", width: 83, height: 65, x: 0.15, y: -65, rotation: -40, delay: 3.5, speed: 2.5)
        throwFood("cookie", width: 55, height: 26, x: 0.8, y: -86, rotation: -25, delay: 5, speed: 2.75)
        throwFood("cheese", width: 56, height: 51, x: 0.5, y: -351, rotation: 140, delay: 2, speed: 3.25)
        throwFood("apple", width: 41, height: 48, x: 0.9, y: -348, rotation: -60, delay: 0.5, speed: 4)
        throwFood("blueSoda", width: 29, height: 50, x: 0.25, y: -250, rotation: 30, delay: 1, speed: 3.75)
        throwFood("cupcake", width: 64, height: 70, x: 0.65, y: -180, rotation: 120, delay: 3, speed: 3.5)
        throwFood("coffee", width: 50, height: 70, x: 0.32, y: -150, rotation: 50, delay: 0.5, speed: 3.25)
        throwFood("donut", width: 56, height: 56, x: 0.72, y: -80, rotation: 280, delay: 0, speed: 3.25)
        throwFood("sandwich", width: 93, height: 44, x: 0.18, y: -220, rotation: -120, delay: 0, speed: 3.2)
        throwFood("redSoda", width: 29, height: 50, x: 0.83, y: -300, rotation: 80, delay: 0.8, speed: 3.75)
        throwFood("watermelon", width: 89, height: 43, x: -0.1, y: -100, rotation: -65, delay: 1.2, speed: 3)
    }

    func throwFood(image:String, width:Int, height:Int, x:Double, y:Int, rotation:Double, delay:Double, speed:Double) {
        let imageView = UIImageView(image: UIImage(named: image))
        let theX = x * Double(view.frame.size.width)
        let theXInt = Int(theX)
        imageView.frame = CGRect(x: theXInt, y: y, width: width, height: height)
        fourthScreen.addSubview(imageView)
        fourthScreen.sendSubviewToBack(imageView)
        UIView.animateWithDuration(speed, delay: delay, options: [.CurveLinear, .Repeat], animations: {
            imageView.frame.origin.y = self.view.frame.size.height
            let theRotation = CGFloat(rotation * M_PI / 180)
            imageView.transform = CGAffineTransformRotate(imageView.transform, theRotation)
        }) { (Bool) in
            imageView.removeFromSuperview()
        }
    }

    @IBAction func tappedTheButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { 
            
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
