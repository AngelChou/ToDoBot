//
//  ViewController.swift
//  ToDoBot
//
//  Created by Shun-Ching, Chou on 2017/5/5.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dueTodayTable: UITableView!
    @IBOutlet weak var fiveDayTable: UITableView!
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var dueTodayCount: UILabel!
    @IBOutlet weak var dueFiveDayCount: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.barTintColor = UIColor(red: 88/255, green: 101/255, blue: 167/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

