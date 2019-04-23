//
//  ViewControllerLogin.swift
//  RestApi
//
//  Created by Annette Z on 23/04/2019.
//  Copyright © 2019 Vidzemes Augstkola. All rights reserved.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var emailtextfield: UITextField!
 
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let userEmailText = emailtextfield.text
        let userPasswordText = passwordText.text
        
        if (userEmailText == "admin"){
            if (userPasswordText == "admin"){
                //login successful
                
            }
            else{
                displayAlertMessage(userMessage: "Password Not Correct")
                //ALert
                return;
            }
        }else{
            displayAlertMessage(userMessage: "UserName Not Correct")
            //ALert
            return;
        }
    
    }
    func displayAlertMessage(userMessage: String){
        var alert = UIAlertController(title:"ALERT", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }


}
