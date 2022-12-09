//
//  ViewRecipesController.swift
//  CleverKitchen
//
//  Created by Mahadevan Jeevahasan on 12/5/22.
//

import UIKit
import CoreData

class ViewRecipesController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var recipeValue : [Recipe]?
    
    let recipeName = ["Test1", "Test2", "Test3"]
    
    let recipeImage = [UIImage(named: "recipe3"), UIImage(named: "recipe3"), UIImage(named: "recipe3")]
    
    var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "CleverKitchen")
       container.loadPersistentStores(completionHandler: { (storeDescription, error) in
           if let error = error as NSError? {
               fatalError("Unresolved error \(error), \(error.userInfo)")
           }
       })
       return container
   }()
    
    var userValue = [User]()
    var userName : String = ""
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.recipeValue?.removeAll()
        let context = persistentContainer.viewContext
        let fetchrequet = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        let defaults = UserDefaults.standard
        let currentUser = defaults.object(forKey: "email") as! String
        
        do{
         
            guard let fetchObject = try! context.fetch(fetchrequet) as? [Recipe] else { return }
            let recipeVal = fetchObject.filter({ $0.emailId == currentUser })
            if(recipeVal.count==0){
                let dialogMessage = UIAlertController(title: "Oops!!", message: "There are no recipes available", preferredStyle: .alert)
                let goBack = UIAlertAction(title: "Go Back", style: .default, handler: { (action) -> Void in
                    self.navigationController?.popViewController(animated:true)
                })
                dialogMessage.addAction(goBack)
                self.present(dialogMessage, animated: true, completion: nil)
            }else{
                self.recipeValue = recipeVal
                self.recipeCollectionView.reloadData()
            }
        }catch{
            print(error)
            
        }
        
        let fetchUserRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        guard let fetchUserObject = try! context.fetch(fetchUserRequest) as? [User] else { return }
    
        userValue = fetchUserObject.filter({$0.emailId == currentUser})
        for value in userValue{
            self.userName =  value.name ?? ""
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeValue?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewRecipesCollectionViewCell
        
        cell.recipeName.text = recipeValue?[indexPath.item].recipeName ?? ""
        cell.recipeImage.image =  UIImage(named: "recipe3")
        cell.recipeIngredients.text = recipeValue?[indexPath.item].ingredients
        cell.userName.text = self.userName
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailsController") as! RecipeDetailsController
        vc.recipes = self.recipeValue?[indexPath.item] ?? Recipe()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
