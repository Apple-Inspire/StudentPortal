//
//  contactus.swift
//  StudentPortal
//
//  Created by Deno on 22/09/18.
//  Copyright © 2018 g h raisoni. All rights reserved.
//

import UIKit

class contactus: UIViewController {

    @IBAction func back2(_ sender: UIButton) {
        
        let regisitration = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
        self.navigationController?.pushViewController(regisitration!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
