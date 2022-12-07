//
//  RecipeDetailsController.swift
//  CleverKitchen
//
//  Created by Mahadevan Jeevahasan on 12/5/22.
//

import UIKit

class RecipeDetailsController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    
    var recipes = Recipe()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = recipes.recipeName
        self.title1Label.text = recipes.ingredients
        self.descriptionTitleLabel.text = "How To Make \(recipes.recipeName ?? "")"
        self.descriptionTextView.text = recipes.descriptionValue
    }
}
