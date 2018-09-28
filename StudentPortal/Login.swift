//
//  Login.swift
//  Studentiinfo
//
//  Created by yashn on 17/09/18.
//  Copyright © 2018 ghrce. All rights reserved.
//

import UIKit
import Firebase

class Login: UIViewController {
 
    @IBAction func back(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var loguname: UITextField!
    @IBOutlet weak var logpass: UITextField!
    
    @IBAction func back1(_ sender: UIButton) {
        
        let regisitration = self.storyboard?.instantiateViewController(withIdentifier : "home") as?home
        self.navigationController?.pushViewController(regisitration!, animated: true)
    }
    @IBAction func signup(_ sender: UIButton) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logbtn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: loguname.text!, password: logpass.text!) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
                print("Successful")
                ProgressHUD.showSuccess("Login Successful")
                let regView = self.storyboard?.instantiateViewController(withIdentifier: "reg") as? reg
                self.navigationController?.pushViewController(regView!, animated: true)
                
            } else {
                print("Error logging in: \(error!.localizedDescription)")
                 ProgressHUD.showError("Incorrect Username or Password")
            }
        }
        
        clear()
    }
    
    
    func clear()
    {
        loguname.text = ""
        logpass.text = ""
    }
}
