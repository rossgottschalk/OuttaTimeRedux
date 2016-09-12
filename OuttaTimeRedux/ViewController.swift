//
//  ViewController.swift
//  OuttaTimeRedux
//
//  Created by Ross Gottschalk on 8/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//


import UIKit

protocol SetDestinationDelegate
{
    func didFinish(dateSet: NSDate)
}


class ViewController: UIViewController, SetDestinationDelegate
{
    @IBOutlet weak var destinationDateLabel: UILabel!
    @IBOutlet weak var presentDateLabel: UILabel!
    @IBOutlet weak var lastDateLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    let dateFormat = NSDateFormatter()
    var speedTimer = NSTimer?()
    var currentSpeed: Int = 0
    var startingSpeed: Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Outta Time"
        
       
        dateFormat.dateStyle = .MediumStyle
        dateFormat.timeStyle = .NoStyle
        let todaysDate = NSDate()
        presentDateLabel.text = dateFormat.stringFromDate(todaysDate)
        destinationDateLabel.text = "?????"
        //speedLabel.text = "61mph"
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Action Handlers
   
    @IBAction func travelBackTapped(sender: AnyObject)
    {
        speedTimer = NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector: #selector (ViewController.travelBackStarted), userInfo: nil, repeats: true)
    }
    
    func travelBackStarted()
    {
        if (startingSpeed < 88)
        {
            startingSpeed = startingSpeed + 1
            speedLabel.text = "\(startingSpeed)MPH"
        }
        else
        {
            speedTimer?.invalidate()
            startingSpeed = 0
            speedLabel.text = "-- MPH"
            lastDateLabel.text = presentDateLabel.text
            presentDateLabel.text = destinationDateLabel.text
            destinationDateLabel.text = "Pick A New Date"
        }
    }
    
    func didFinish(dateSet: NSDate)
    {
        destinationDateLabel.text = dateFormat.stringFromDate(dateSet)
    }
    
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "datePickerSegue"
        {
            let datePickerVC = segue.destinationViewController as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }

}


