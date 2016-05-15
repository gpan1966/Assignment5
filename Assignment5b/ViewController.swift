//
//  ViewController.swift
//  Assignment5b
//
//  Created by George Pantazis on 8/05/2016.
//  Copyright © 2016 PAN Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AddReminders, UITableViewDataSource, UITextFieldDelegate {


   @IBOutlet weak var ToDoTableView: UITableView!
   
   var ReminderArray = [String]()

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
   {
   //   print (segue.identifier)
      if segue.identifier == "segAdd"
      {
         if let viewController = segue.destinationViewController as? ToDoController
         {
            viewController.delegate = self
         }
      }
      else // Hande View Screen
      {
         
         let indexPath : NSIndexPath = ToDoTableView.indexPathForSelectedRow!
        
         
         let ViewDetailsController : ViewDetailsViewController = segue.destinationViewController as! ViewDetailsViewController
         
         
         ViewDetailsController.reminderText = ReminderArray[indexPath.row]
         
         
      }
   }
   
   func didReceiveReminders(addReminders: ToDo)
   {
      print (addReminders.Reminder)

      ReminderArray.insert(addReminders.Reminder, atIndex: ReminderArray.count)
      
      ToDoTableView.reloadData()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }


   func numberOfSectionsInTableView(tableView: UITableView) -> Int
   {
      return 1
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return ReminderArray.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
   {
      
      let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell")!
      cell.textLabel?.text = ReminderArray[indexPath.row]
      
      print(ReminderArray[indexPath.row])

      return cell
   }

   func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
      return true
   }
   
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      
      if editingStyle == .Delete
      {
         ReminderArray.removeAtIndex(indexPath.row)
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:  .Left)
      }
   }

}

