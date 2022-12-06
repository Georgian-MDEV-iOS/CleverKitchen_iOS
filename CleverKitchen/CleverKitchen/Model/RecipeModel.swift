//
//  RecipeModel.swift
//  CleverKitchen
//
//  Created by Mahadevan Jeevahasan on 12/5/22.
//

import SwiftUI

//MARK: - RECIPE MODEL

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var ingredients: [String]
    var description: String
}
