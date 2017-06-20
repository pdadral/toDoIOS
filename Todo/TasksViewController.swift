//
//  TasksViewController.swift
//  Todo
//
//  Created by Dadral on 18/06/17.
//  Copyright © 2017 Dadral. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks :[Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeTasks()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.Important{
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else{
            cell.textLabel?.text = task.name
        }
        
        
        return cell
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Play Soccer"
        task1.Important = false
        
        let task2 = Task()
        task2.Important = true
        task2.name = "Cooking"
        return [task1,task2]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
    
}

