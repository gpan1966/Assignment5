//
//  ViewDetailsViewController.swift
//  Assignment5b
//
//  Created by George Pantazis on 9/05/2016.
//  Copyright © 2016 PAN Software. All rights reserved.
//

import UIKit

// PART 3

class ViewDetailsViewController: UIViewController
{

   @IBOutlet weak var lblReminder: UILabel!
   
   var reminderText = String()
   
   override func viewDidLoad()
   {
      super.viewDidLoad()

      lblReminder.text = reminderText
    }
}
