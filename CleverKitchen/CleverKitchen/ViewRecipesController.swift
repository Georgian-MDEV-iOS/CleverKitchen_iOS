//
//  ViewRecipesController.swift
//  CleverKitchen
//
//  Created by Mahadevan Jeevahasan on 12/5/22.
//

import UIKit

class ViewRecipesController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let recipeName = ["Test1", "Test2", "Test3"]
    
    let recipeImage = [UIImage(named: "recipe3"), UIImage(named: "recipe3"), UIImage(named: "recipe3")]
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewRecipesCollectionViewCell
        
        cell.recipeName.text = recipeName[indexPath.row]
        cell.recipeImage.image = recipeImage[indexPath.row]
        
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
    
    
}
