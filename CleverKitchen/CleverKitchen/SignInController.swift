//
//  SignInController.swift
//  CleverKitchen
//
//  Created by Chandu on 30/11/22.
//

import UIKit

class SignInController: UIExtensionsController {


    @IBOutlet weak var emailAddress: CKTextField!
    
    @IBOutlet weak var password: CKTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Sign In"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
   
        if(emailAddress.text == "admin" &&
            password.text == "admin"){
            print(emailAddress.text)
            print(password.text)
        }
    }
 
     @IBAction func onSignUp(_ sender: Any) {
         let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
         
         signUpViewController.emailAddress = emailAddress
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
