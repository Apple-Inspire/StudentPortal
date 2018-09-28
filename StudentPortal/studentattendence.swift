//
//  studentattendence.swift
//  StudentPortal
//
//  Created by Deno on 22/09/18.
//  Copyright © 2018 g h raisoni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MapKit
import CoreLocation
import FirebaseDatabase

class studentattendence: UIViewController,CLLocationManagerDelegate ,MKMapViewDelegate {
    
    
    @IBAction func back3(_ sender: UIButton) {
    
        let regisitration = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
        self.navigationController?.pushViewController(regisitration!, animated: true)
    }
    
    
    
    
    

    @IBOutlet weak var roll: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var map: MKMapView!

    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var datetimelabl: UILabel!
    
    var ref : DatabaseReference!
    var Long:Double = 0.0
    var Latg:Double = 0.0
    let locationManager = CLLocationManager()
    
    @IBAction func submit(_ sender: UIButton) {
        
        lat.text = String(Latg)
        long.text = String(Long)
        if(Long == 21.1070464 && Latg == 79.0033643)
        {
        //self.ref.child(name.text!).childByAutoId().setValue(["Name":name.text,"RollNo":roll.text,"DateTime":datetimelabl.text,"LocationLat":long.text,"LocationLong":lat.text])
            
            self.ref.child(name.text!).childByAutoId().setValue(["Name" : name.text,"lat" : lat.text,"long" : long.text,"datetimelabl" : datetimelabl.text] )
            
            print("Student Attendance Marked")
            ProgressHUD.showSuccess("Attendance Marked")
 
            
        }
        else
        {
            print("Not marked")
            ProgressHUD.showError("Attendance Not Marked")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         ref = Database.database().reference()
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
       // let dateString = formatter.string(from: pow)
        //print(dateString)
       
        
        let result = formatter.string(from: date)
        
       datetimelabl.text = result
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        // Update location lang and lattude
        lat.text = String(Latg)
        long.text = String(Long)

        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        print(locValue.latitude)
        print(locValue.longitude)
        Long = locValue.latitude
        Latg = locValue.longitude
        
        
        
        //mapView1.setRegion(viewRegion, animated: false)
        
        // self.map.setRegion(UIRegion, animated: true)
        //return (locValue.latitude)
        
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
