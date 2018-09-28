//
//  Registration.swift
//  StudentPortal
//
//  Created by Deno on 18/09/18.
//  Copyright © 2018 g h raisoni. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class Registration: UIViewController {
    var ref: DatabaseReference!
 
    
    
   
    @IBAction func back(_ sender: UIButton) {
        
        let regisitration = self.storyboard?.instantiateViewController(withIdentifier : "home") as?home
        self.navigationController?.pushViewController(regisitration!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

               ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var namer: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var cornpass: UITextField!
   
    @IBAction func signup(_ sender: UIButton) {
        
        //Saving data in firebase
 
        //ref.child("name").childByAutoId().setValue("yash")
        
        self.ref.child(namer.text!).childByAutoId().setValue(["Name" : namer.text,"email" : email.text,"pass" : pass.text,"conrnpass" : cornpass.text] )
      Auth.auth().createUser(withEmail: email.text!, password: pass.text!, completion:{
            (user,error) in
            
            if error  != nil {
                print(error!)
                
 ProgressHUD.showError("Registration Failed")
                
            }else {
                
                print("Registration Successful")
                ProgressHUD.showSuccess("Registration Successful")
                let regs2 = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
                self.navigationController?.pushViewController(regs2!, animated: true)
            }
            
        
        })
        
      
        
        
        
        //retriving data from firebase
        
        func clear()
        {
            namer.text=""
            email.text=""
            pass.text=""
            cornpass.text=""
            
        }
        
    }
    /*
     @IBAction func signin(_ sender: UIButton) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signin(_ sender: Any) {
    }
    
}
