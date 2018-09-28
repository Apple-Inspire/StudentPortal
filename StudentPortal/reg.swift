//
//  ViewController1.swift
//  StudentPortal
//
//  Created by Deno on 21/09/18.
//  Copyright © 2018 g h raisoni. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class reg: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref: DatabaseReference!
    

    @IBOutlet weak var studentname: UILabel!
    @IBOutlet weak var table: UITableView!
    let list = ["Registration" , "Attendance" ,"Website", "Contact","Logout"]
    
    var prof: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
         table.isHidden = true
        table.dataSource = self as? UITableViewDataSource
        table.delegate = self as? UITableViewDelegate
        
        

        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        prof = indexPath.row
        if(prof == 0)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "regs2") as? regs2
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 1)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "studentattendence") as? studentattendence
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 2)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "webViewCrt") as? webViewCrt
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 3)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "contactus") as? contactus
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 4)
        {
            do{
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
                ProgressHUD.showSuccess("Logout Successful")

            }
            catch{
                print("Error in Logging Out")
                
                ProgressHUD.showError("Error in Logging Out")
            }
        }
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "index-1"))
        return(cell)
        
    }
    
    var counterx: Int = 0
    
    @IBAction func bfb(_ sender: UIButton) {
        counterx = counterx+1
        if(counterx%2 == 0)
        {
            table.isHidden = true
        }
        else{
            table.isHidden = false
        }
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

