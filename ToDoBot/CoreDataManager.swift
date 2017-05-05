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
    
    static func deleteData(entityName:String){
        
        let managedObject = getManagedObject()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try managedObject.fetch(request)
            for result in results {
                managedObject.delete(result as! NSManagedObject)
            }
        }
        catch{
            print("there are an error deleting data")
        }
    }
    
    static func save(todoItem:String, dueDate:NSDate, complete:Bool){
        let managedObject = getManagedObject()
    
        let entity = NSEntityDescription.entity(forEntityName: "ToDos", in: managedObject)
        let todo = NSManagedObject(entity: entity!, insertInto: managedObject)
        todo.setValue(todoItem, forKey: "todoItem")
        todo.setValue(dueDate, forKey: "dueDate")
        todo.setValue(complete, forKey: "complete")
        
        do{
            try managedObject.save()
        }
        catch{
            print("save: Error saving")
        }
    }
    
    static func update(todoItem:ToDos){
        
    }
    
}
