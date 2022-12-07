//
//  SignInController.swift
//  CleverKitchen
//
//  Created by Chandu on 30/11/22.
//

import UIKit
import CoreData

class SignInController: UIExtensionsController {


    @IBOutlet weak var emailAddress: CKTextField!
    
    @IBOutlet weak var password: CKTextField!
    
    var signInValues:[User]?
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
        self.title="Sign In"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        guard let emaiId = emailAddress.text,!emaiId.isEmpty else {return}
        guard let password = password.text, !password.isEmpty else {return}
        
        var context = persistentContainer.viewContext
        let fetchrequet = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            guard let fetchObject = try! context.fetch(fetchrequet) as? [User] else { return }
            self.signInValues = fetchObject
        }catch{
            print(error)
            
        }
        let userValue = signInValues?.filter({$0.emailId == emaiId && $0.password == password})
        if userValue?.count ?? 0 > 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.navigationController?.setNavigationBarHidden(true, animated: true)
            self.navigationController?.pushViewController(vc, animated:true)
        }
        
    }
 
     @IBAction func onSignUp(_ sender: Any) {
         let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
         
         signUpViewController.navigationController?.setNavigationBarHidden(true, animated: true)
         self.navigationController?.pushViewController(signUpViewController, animated: true)
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
