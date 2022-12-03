//
//  SignUpController.swift
//  CleverKitchen
//
//  Created by Chandu on 30/11/22.
//

import UIKit

class SignUpController : UIExtensionsController {

    var emailAddress : CKTextField?
    var confirmEmailAddress: CKTextField?
    var password: String?
    var confirmPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(emailAddress?.text)
        // Do any additional setup after loading the view.
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
