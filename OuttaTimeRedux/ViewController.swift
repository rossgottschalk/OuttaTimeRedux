//
//  ViewController.swift
//  OuttaTimeRedux
//
//  Created by Ross Gottschalk on 8/15/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//


//In Objective-C:
//
//@protocol DetailViewControllerProtocol <NSObject>
//- (void)didFinishTask:(DetailViewController *)sender;
//@end
//The Swift code is similar:
//
//protocol DetailViewControllerDelegate: class {
//    func didFinishTask(sender: DetailViewController)
//}

import UIKit

protocol DateDelegate: class
{
    func dateChosen(sender: DatePickerViewController)
}


class ViewController: UIViewController {
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Outta Time"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

