//
//  CreateTaskViewController.swift
//  Todo
//
//  Created by Dadral on 19/06/17.
//  Copyright © 2017 Dadral. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addTapped(_ sender: Any) {
        //Create a task from the oulet imformation
        let task = Task()
        task.name = taskNameTextField.text!
        task.Important = importantSwitch.isOn
        
        
        //add a new task to array in previous controller
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        
        
        navigationController!.popViewController(animated: true)
    }
    

}
