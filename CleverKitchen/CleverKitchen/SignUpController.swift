//
//  SignUpController.swift
//  CleverKitchen
//
//  Created by Chandu on 30/11/22.
//

import UIKit
import CoreData

class SignUpController : UIExtensionsController {

    
    @IBOutlet weak var nameTextField: CKTextField!
    
    @IBOutlet weak var emailTextField: CKTextField!
    
    @IBOutlet weak var passwordTextField: CKTextField!
    
     var persistentContainer: NSPersistentContainer = {
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
    

    @IBAction func signUpAction(_ sender: Any) {
      
        guard let name = nameTextField.text,!name.isEmpty else{return}
        guard let email = emailTextField.text,!email.isEmpty else{return}
        guard let password = passwordTextField.text,!password.isEmpty else{return}
        let users = User(context: persistentContainer.viewContext)
        users.name = name
        users.password = password
        users.emailId = email
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("#### Saved succesfully")
                let defaults = UserDefaults.standard
                defaults.set(email, forKey: "email")
                UserDefaults.standard.synchronize()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.navigationController?.setNavigationBarHidden(true, animated: true)
                self.navigationController?.pushViewController(vc, animated:true)
                
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
   
    @IBAction func signInAction(_ sender: Any) {
    }
}
