//
//  HomeViewController.swift
//  CleverKitchen
//
//  Created by Sethuram Vijayakumar on 2022-12-07.
//

import UIKit

class HomeViewController: UIExtensionsController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    @IBAction func viewRecipeAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewRecipesController") as! ViewRecipesController
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addRecipeAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddRecipesViewController") as! AddRecipesViewController
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
