//
//  WalkthroughController.swift
//  CleverKitchen
//
//  Created by Sethuram Vijayakumar on 2022-12-06.
//

import UIKit

class WalkthroughController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInController") as! SignInController
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }


     @IBAction func signUpAction(_ sender: Any) {
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
         vc.navigationController?.setNavigationBarHidden(true, animated: true)
         self.navigationController?.pushViewController(vc, animated: true)
     }
    
}
