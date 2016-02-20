//
//  ToDoItem.swift
//  To-Do List App
//
//  Created by Gauthier Dieppedalle on 2/19/16.
//  Copyright © 2016 Gauthier Dieppedalle. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.itemName = name
    }
}
