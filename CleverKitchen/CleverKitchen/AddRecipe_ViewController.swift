//
//  AddRecipe_ViewController.swift
//  CleverKitchen
//
//  Created by Palika Sathish on 2022-12-06.
//

import UIKit

class AddRecipe_ViewController: UIViewController {
    
    // Create new Alert
    var dialogMessage = UIAlertController(title: "Alert", message: "Please make sure all the feilds are filled!", preferredStyle: .alert)
    
    // Create OK button with action handler
    let ok = UIAlertAction(title: "OK", style: .default, handler: {
        UIAlertAction in
        print("Ok button tapped")
     })
    
    //Add OK button to a dialog message

    // Present Alert to
    //self.present(dialogMessage, animated: true, completion: nil)
    
    
    
    @IBOutlet weak var reipeName: UITextField!
    
    
    @IBOutlet weak var ingredients: UITextField!
    
    
    @IBOutlet weak var recipeDescription: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        if reipeName.text == "" || ingredients.text == "" || recipeDescription.text == ""  {
            
            let dialogMessage = UIAlertController(title: "Alert", message: "Please make sure all the feilds are filled!", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: {
                UIAlertAction in
                print("Ok button tapped")
             })
            dialogMessage.addAction(ok);
            self.present(dialogMessage, animated: true, completion: nil)
        }else{
            print("all feilds entered")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
