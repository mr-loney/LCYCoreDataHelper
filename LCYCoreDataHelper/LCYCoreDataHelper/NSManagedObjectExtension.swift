//
//  NSManagedObjectExtension.swift
//  
//
//  Created by LiChunyu on 16/1/21.
//  Copyright © 2016年 Leacode. All rights reserved.
//

import UIKit
import CoreData

public extension NSManagedObject {

    func deleteEntity() throws {
        guard let context = self.managedObjectContext else {
            return
        }
        try self.deleteEntityInContext(context)
    }
    
    func deleteEntityInContext(context: NSManagedObjectContext) throws {
        let entityInContext = try context.existingObjectWithID(self.objectID)
        context.deleteObject(entityInContext)
    }
    
}
