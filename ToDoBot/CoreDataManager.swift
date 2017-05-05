//
//  CoreDataManager.swift
//  ToDoBot
//
//  Created by Shun-Ching, Chou on 2017/5/5.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static func getManagedObject() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    static func getData(entityName:String, predicate:NSPredicate?=nil) -> [NSManagedObject]{
        
        var resultsManagedObject:[NSManagedObject] = []
        let managedObject = getManagedObject()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        if predicate != nil {
            request.predicate = predicate
        }
        
        do{
            let results = try managedObject.fetch(request)
            resultsManagedObject = results as! [NSManagedObject]
        }
        catch{
            print("there are an error retrieving data")
        }
        return resultsManagedObject
    }
    
    static func save(todoItem:String, dueDate:NSDate, complete:Bool){
        
    }
    
    static func update(todoItem:ToDoItem){
        
    }
    
}
