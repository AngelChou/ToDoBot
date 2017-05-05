//
//  AddViewController.swift
//  ToDoBot
//
//  Created by Shun-Ching, Chou on 2017/5/5.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDoItem: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    var dueDate:Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = UIColor(red: 137.0/255, green: 203.0/255, blue: 240.0/255, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButton_click))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveButton_click(){
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func datepicker_changed(_ sender: Any) {
        dueDate = dueDatePicker.date
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
