//
//  ToDoController.swift
//  Assignment5b
//
//  Created by George Pantazis on 8/05/2016.
//  Copyright © 2016 PAN Software. All rights reserved.
//

import UIKit

protocol AddReminders {
   func didReceiveReminders(reminder: ToDo)
}

class ToDoController: UIViewController {

   @IBOutlet weak var txtReminder: UITextField!
   
   
   var delegate: AddReminders?
   
   
   @IBAction func btnSave(sender: AnyObject)
   {
      
      var addReminders = ToDo()
      
      if txtReminder.text != ""
      {
         addReminders.Reminder = txtReminder.text!
         
         delegate?.didReceiveReminders(addReminders)
         
         navigationController?.popViewControllerAnimated(true)
      }
      else
      {
         DisplayError("No Reminder Entered", errorMsg: "You must enter a Reminder")
      }
      
   }
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
   func DisplayError(errorTitle: String, errorMsg: String)
   {
      let InputError = UIAlertController(title: errorTitle, message: errorMsg, preferredStyle: UIAlertControllerStyle.Alert)
      
      let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
      
      InputError.addAction(okAction)
      
      self.presentViewController(InputError, animated: true, completion: nil)
      
   }
}
