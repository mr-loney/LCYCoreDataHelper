//
//  User.swift
//  LCYCoreDataHelperExample
//
//  Created by LiChunyu on 16/1/22.
//  Copyright © 2016年 leacode. All rights reserved.
//

import Foundation
import CoreData
import LCYCoreDataHelper

class User: NSManagedObject {
    
    static var i = 0
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
    }

    class func insertCoreDataModel() {
        
        let user: User? = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: globalContext!) as? User

        user?.id = i
        i += 1
        user?.username = "User\(i)"
        user?.amount = 23.23

        do {
            try coreDataHelper?.backgroundSaveContext()
        } catch {
            print("save User failed, error: \(error)")
        }
        
    }
    
    class func fetchCoreDataModels() -> [User] {
        
        let fetchRequest: NSFetchRequest = NSFetchRequest(entityName: "User")
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: globalContext!)
        fetchRequest.entity = entity
        
        do {
            let users: [User] = try globalContext?.executeFetchRequest(fetchRequest) as! [User]
            return users
        } catch {
            return []
        }
        
    }
    
}

