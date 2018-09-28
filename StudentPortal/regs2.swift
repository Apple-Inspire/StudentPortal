//
//  regs2.swift
//  StudentPortal
//
//  Created by Deno on 22/09/18.
//  Copyright © 2018 g h raisoni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class regs2: UIViewController {
    var ref: DatabaseReference!

    @IBAction func back4(_ sender: UIButton) {
        
        let regisitration = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
        self.navigationController?.pushViewController(regisitration!, animated: true)
    }
    @IBOutlet weak var studentname: UITextField!
    @IBOutlet weak var branch: UITextField!
    @IBOutlet weak var mobileno: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        
         self.ref.child(studentname.text!).childByAutoId().setValue(["studentname" : studentname.text,"branch" : branch.text,"mobileno" : mobileno.text,"mail" : mail.text,"address" : address.text] )
        
        ProgressHUD.showSuccess("Registration Done Successfully")

        self.clear()
        
    }
    
  
    

    
 
   
    func clear()
    
    {
        studentname.text = ""
        branch.text=""
        mobileno.text = ""
        mail.text = ""
        address.text=""
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
