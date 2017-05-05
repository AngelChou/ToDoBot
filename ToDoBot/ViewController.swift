//
//  ViewController.swift
//  ToDoBot
//
//  Created by Shun-Ching, Chou on 2017/5/5.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dueTodayTable: UITableView!
    @IBOutlet weak var fiveDayTable: UITableView!
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var dueTodayCount: UILabel!
    @IBOutlet weak var dueFiveDayCount: UILabel!
    
    var todoDueToday:[ToDos] = []
    var todos:[ToDos] = []
    var todoFiveDay:[ToDos] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor(red: 88/255, green: 101/255, blue: 167/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        dueTodayTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fiveDayTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        CoreDataManager.self.deleteData(entityName: "ToDos")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    func refreshData() {
        todos = CoreDataManager.getData(entityName: "ToDos") as! [ToDos]

        todoDueToday = CoreDataManager.getData(entityName: "ToDos", predicate: NSPredicate(format: "dueDate<=%@", (NSDate()))) as! [ToDos]

        let dayComponent = NSDateComponents()
        dayComponent.day = 5
        let theCalendar = NSCalendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent as DateComponents, to: NSDate() as Date)
        todoFiveDay = CoreDataManager.getData(entityName: "ToDos", predicate: NSPredicate(format: "dueDate<%@", (nextDate)! as CVarArg)) as! [ToDos]
        
        dueTodayTable.reloadData()
        fiveDayTable.reloadData()
        mainTable.reloadData()
        
    }
    
//    //MARK: tableview functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dueTodayTable {
            dueTodayCount.text = String(todoDueToday.count)
            return todoDueToday.count
        }
        else if tableView == fiveDayTable {
            dueFiveDayCount.text = String(todoFiveDay.count)
            return todoFiveDay.count
        }
        else{
            return todos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == dueTodayTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let todo = todoDueToday[indexPath.row]
            cell.textLabel!.text = String(format: "%@: %@", todo.todoItem!, todo.dueDate!)
            return cell
        }
        else if tableView == fiveDayTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let todo = todoFiveDay[indexPath.row]
            cell.textLabel!.text = String(format: "%@: %@", todo.todoItem!, todo.dueDate!)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            let todo = todos[indexPath.row]
            cell.todoItem.text = String(format: "%@: %@", todo.todoItem!, todo.dueDate!)
            cell.checkbox.text = "☑️"
            if todo.complete == true {
                cell.checkbox.text = "✅"
            }
            return cell
        }
    }
}

