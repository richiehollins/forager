//
//  FTUXViewController.swift
//  Forager
//
//  Created by Hollins, Richie on 5/12/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class FTUXViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var paginationDots: UIPageControl!
    
    var ftuxVC1: UIViewController!
    var ftuxVC2: UIViewController!
    var ftuxVC3: UIViewController!
    var ftuxVC4: UIViewController!
    
    var blueColor: UIColor!
    var purpleColor: UIColor!
    var pinkColor: UIColor!
    var yellowColor: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueColor = UIColor(red: 68/255, green: 189/255, blue: 236/255, alpha: 1.0)
        purpleColor = UIColor(red: 107/255, green: 45/255, blue: 92/255, alpha: 1.0)
        pinkColor = UIColor(red: 238/255, green: 72/255, blue: 111/255, alpha: 1.0)
        yellowColor = UIColor(red: 253/255, green: 239/255, blue: 91/255, alpha: 1.0)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        scrollView.contentSize = CGSize(width: view.frame.size.width * 4, height: view.frame.size.height)
        scrollView.delegate = self
        
        ftuxVC1 = storyboard.instantiateViewControllerWithIdentifier("FTUX1")
        ftuxVC1.view.frame.origin.x = self.view.frame.origin.x
        ftuxVC2 = storyboard.instantiateViewControllerWithIdentifier("FTUX2")
        ftuxVC2.view.frame.origin.x = view.frame.size.width
        ftuxVC3 = storyboard.instantiateViewControllerWithIdentifier("FTUX3")
        ftuxVC3.view.frame.origin.x = view.frame.size.width * 2
        ftuxVC4 = storyboard.instantiateViewControllerWithIdentifier("FTUX4") as! FTUX4ViewController
        ftuxVC4.view.frame.origin.x = view.frame.size.width * 3
        
        scrollView.addSubview(ftuxVC1.view)
        scrollView.addSubview(ftuxVC2.view)
        scrollView.addSubview(ftuxVC3.view)
        scrollView.addSubview(ftuxVC4.view)
        
        scrollView.layoutIfNeeded()
        //scrollView.updateConstraints()
        
        throwFood("orange", width: 34, height: 41, x: 0.83, y: -200, rotation: 200, delay: 0.5, speed: 3.25)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        } else {
            paginationDots.hidden = false
        }
    }
    
    func throwFood(image:String, width:Int, height:Int, x:Double, y:Int, rotation:Double, delay:Double, speed:Double) {
        let imageView = UIImageView(image: UIImage(named: image))
        let theX = x * Double(view.frame.size.width)
        let theXInt = Int(theX)
        imageView.frame = CGRect(x: theXInt, y: y, width: width, height: height)
        ftuxVC4.view.addSubview(imageView)
        //ftuxVC4.view.sendSubviewToBack(imageView)
        UIView.animateWithDuration(speed, delay: delay, options: [.CurveLinear, .Repeat], animations: {
            imageView.frame.origin.y = self.view.frame.size.height
            let theRotation = CGFloat(rotation * M_PI / 180)
            imageView.transform = CGAffineTransformRotate(imageView.transform, theRotation)
        }) { (Bool) in
            imageView.removeFromSuperview()
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
