//
//  Recipe+CoreDataProperties.swift
//  CleverKitchen
//
//  Created by Sethuram Vijayakumar on 2022-12-06.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var recipeName: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var descriptionValue: String?
    @NSManaged public var emailId: String?

}

extension Recipe : Identifiable {

}
