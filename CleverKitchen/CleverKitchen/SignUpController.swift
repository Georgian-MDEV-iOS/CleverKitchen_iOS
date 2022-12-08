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
    
    @IBOutlet weak var signUpButton: UIButton!
    
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
        signUpButton.layer.cornerRadius = 10
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpAction(_ sender: Any) {
      
        guard let name = nameTextField.text,!name.isEmpty else{return}
        guard let email = emailTextField.text,!email.isEmpty else{return}
        guard let password = passwordTextField.text,!password.isEmpty else{return}
        let users = User(context: persistentContainer.viewContext)
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                guard let fetchObject = try! context.fetch(fetchrequest) as? [User] else { return }
                self.signInValues = fetchObject
                let userValue = signInValues?.filter({$0.emailId == email})
                
                if(isValidEmail(email)){
                    if(userValue?.count ?? 0 == 0){
                        let defaults = UserDefaults.standard
                        defaults.set(email, forKey: "email")
                        users.name = name
                        users.password = password
                        users.emailId = email
                        UserDefaults.standard.synchronize()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                        vc.navigationController?.setNavigationBarHidden(true, animated: true)
                        self.navigationController?.pushViewController(vc, animated:true)
                    } else{
                        let dialogMessage = UIAlertController(title: "Oops!!", message: "Email Id is already registered", preferredStyle: .alert)
                        let signIn = UIAlertAction(title: "Sign In", style: .default, handler: { (action) -> Void in
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
                            vc.navigationController?.setNavigationBarHidden(true, animated: true)
                            self.navigationController?.pushViewController(vc, animated:true)
                        })
                        
                        let continueSignUp = UIAlertAction(title: "Continue", style: .default)
                        dialogMessage.addAction(signIn)
                        dialogMessage.addAction(continueSignUp)
                        self.present(dialogMessage, animated: true, completion: nil)
                    }
                }else{
                    let dialogMessage = UIAlertController(title: "Oops!!", message: "Email Id is not valid", preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "Cancel", style: .default)
                    dialogMessage.addAction(cancel)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
   
    @IBAction func signInAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(vc, animated:true)
    }
}
