//
//  AddRecipesViewController.swift
//  CleverKitchen
//
//  Created by Palika  on 2022-12-07.
//

import UIKit
import CoreData

class AddRecipesViewController: UIExtensionsController {
    @IBOutlet weak var recipeTF: CKTextField!
    
    @IBOutlet weak var ingredientsTF: CKTextField!
    
    @IBOutlet weak var descriptionTF: CKTextField!
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CleverKitchen")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_ sender: Any) {
        guard let recipesTitle = recipeTF.text, !recipesTitle.isEmpty else{return}
        guard let ingredentients = ingredientsTF.text, !ingredentients.isEmpty else{return}
        guard let descriptions = descriptionTF.text, !descriptions.isEmpty else{return}
        
        let recipes = Recipe(context: persistentContainer.viewContext)
        recipes.recipeName = recipesTitle
        recipes.descriptionValue = descriptions
        recipes.ingredients = ingredentients
        if let email = UserDefaults.standard.value(forKey: "email") as? String{
            recipes.emailId = email
        }
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("#### Saved succesfully")
                self.navigationController?.popViewController(animated: true)
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
    @IBAction func backAction(_ sender: Any) {
    }
    

}
