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
        guard let emailId = emailAddress.text,!emailId.isEmpty else {return}
        guard let password = password.text, !password.isEmpty else {return}
        
        let context = persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        guard let fetchObject = try! context.fetch(fetchrequest) as? [User] else { return }
        
        
        
        self.signInValues = fetchObject
      
        let userValue = signInValues?.filter({ $0.emailId == emailId && $0.password == password })
        
        if(isValidEmail(emailId)){
            if (userValue?.count ?? 0 > 0){
                let defaults = UserDefaults.standard
                defaults.set(emailId, forKey: "email")
                UserDefaults.standard.synchronize()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.navigationController?.setNavigationBarHidden(true, animated: true)
                self.navigationController?.pushViewController(vc, animated:true)
            }else{
                let dialogMessage = UIAlertController(title: "Oops!!", message: "Email Id is not registered", preferredStyle: .alert)
                let signUp = UIAlertAction(title: "Sign Up", style: .default, handler: { (action) -> Void in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
                    vc.navigationController?.setNavigationBarHidden(true, animated: true)
                    self.navigationController?.pushViewController(vc, animated:true)
                })
                
                let continueSignIn = UIAlertAction(title: "Continue", style: .default)
                dialogMessage.addAction(signUp)
                dialogMessage.addAction(continueSignIn)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }else{
            let dialogMessage = UIAlertController(title: "Oops!!", message: "Email Id is not valid", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .default)
            dialogMessage.addAction(cancel)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
    }
 
     @IBAction func onSignUp(_ sender: Any) {
         let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
         
         signUpViewController.navigationController?.setNavigationBarHidden(true, animated: true)
         self.navigationController?.pushViewController(signUpViewController, animated: true)
     }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
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
