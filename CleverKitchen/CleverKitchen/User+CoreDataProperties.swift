//
//  User+CoreDataProperties.swift
//  CleverKitchen
//
//  Created by Sethuram Vijayakumar on 2022-12-06.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var emailId: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
