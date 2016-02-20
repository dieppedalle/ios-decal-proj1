//
//  ToDoListTableViewController.swift
//  To-Do List App
//
//  Created by Gauthier Dieppedalle on 2/19/16.
//  Copyright © 2016 Gauthier Dieppedalle. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    @IBAction func unwindForSegue(segue: UIStoryboardSegue) {
        print("unwindSecondView fired in forst view")
        let source: AddToDoViewController = segue.sourceViewController as! AddToDoViewController
        
        
        
        if (source.toDoItem != nil){
            let item: ToDoItem = source.toDoItem!
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
        
        
        
    }
    
    @IBAction func unwindForSegueCancel(segue: UIStoryboardSegue) {
        print("unwindSecondView fired in forst view")
        
    }
    
    @IBAction func unwindForSegueStats(segue: UIStoryboardSegue) {
        print("unwindSecondView fired in forst view")
    }
    
    
    //let defaults = NSUserDefaults.standardUserDefaults()
    var toDoItems: NSMutableArray = []
    var numCompletedTasks = 0
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "statsSegue") {
            let nav = segue.destinationViewController as! UINavigationController
            let statsViewController = nav.topViewController as! StatsViewController
            statsViewController.numCompletedTasks = "\(numCompletedTasks)"
        }
    }
    
    func loadInitialData(){
        
        let item1 = ToDoItem(name: "Buy milk")
        self.toDoItems.addObject(item1)
        //defaults.setObject(toDoItems, forKey: "toDoItems")
        
        let item2 = ToDoItem(name: "Buy eggs")
        self.toDoItems.addObject(item2)
        
        
        let item3 = ToDoItem(name: "Read a book")
        self.toDoItems.addObject(item3)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        
        let cell : UITableViewCell=((tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell))
        
        let todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        
        cell.textLabel!.text = todoitem.itemName as String
        
        if todoitem.completed{
            cell.accessoryType = .Checkmark
        }
        else{
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        if tappedItem.completed {
            numCompletedTasks -= 1
            print(numCompletedTasks)
        }
        else{
            numCompletedTasks += 1
            print(numCompletedTasks)
        }
        
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            var index = indexPath.row;
            self.toDoItems.removeObjectAtIndex(index);
            self.tableView.reloadData()
            //self.toDoItems.removeObjectAtIndex(indexPath);
            //self.tableView.reloadData()
            //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
