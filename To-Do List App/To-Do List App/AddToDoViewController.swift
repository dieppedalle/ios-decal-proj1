//
//  ViewController.swift
//  To-Do List App
//
//  Created by Gauthier Dieppedalle on 2/19/16.
//  Copyright © 2016 Gauthier Dieppedalle. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var toDoItem: ToDoItem?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton{
            return
        }
        
        self.toDoItem = ToDoItem(name: self.textField.text!)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

