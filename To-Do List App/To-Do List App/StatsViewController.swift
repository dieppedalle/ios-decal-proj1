//
//  StatsViewController.swift
//  To-Do List App
//
//  Created by Gauthier Dieppedalle on 2/19/16.
//  Copyright © 2016 Gauthier Dieppedalle. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var numCompletedTasksLabel: UILabel!
    
    var numCompletedTasks = String()
    
    override func viewDidLoad() {
        numCompletedTasksLabel.text = numCompletedTasks
    }
}
