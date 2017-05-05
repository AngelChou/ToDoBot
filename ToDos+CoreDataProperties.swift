//
//  ToDos+CoreDataProperties.swift
//  ToDoBot
//
//  Created by Shun-Ching, Chou on 2017/5/5.
//  Copyright © 2017年 Shun-Ching, Chou. All rights reserved.
//

import Foundation
import CoreData


extension ToDos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDos> {
        return NSFetchRequest<ToDos>(entityName: "ToDos");
    }

    @NSManaged public var todoItem: String?
    @NSManaged public var dueDate: NSDate?
    @NSManaged public var complete: Bool

}
