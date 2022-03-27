//
//  ViewController.swift
//  GetLocation
//
//  Created by Ruilin 😈 on 3/26/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

 
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    let locationManager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy=kCLLocationAccuracyHundredMeters
        //get a customer location: 47, -120
        // Do any additional setup after loading the view.
        startSignificatLocationChange()
       
    }
    
    

    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("have an error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location=locations.last else {return}
        let lat=location.coordinate.latitude
        let log=location.coordinate.longitude
        print(lat)
        print(log)
        
        lblLat.text="Latitude: \(lat)"
        lblLong.text="Longtitude: \(log)"
        getAddress(location: location)
    }
    
    
    func startSignificatLocationChange(){
        if CLLocationManager.significantLocationChangeMonitoringAvailable(){
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func getAddress(location : CLLocation) {
        let clGeocoder = CLGeocoder()
        clGeocoder.reverseGeocodeLocation(location) { placeMarks, error in
            if error != nil {
                self.lblAddress.text = "Unable to get Address"
                return
            }
            
            guard let place = placeMarks?.first else { return }
            
            var address = ""
            if place.name != nil {
                address += place.name! + ", "
            }
            if place.locality != nil {
                address += place.locality! + ", "
            }
            if place.subLocality != nil {
                address += place.subLocality! + ", "
            }
            if place.postalCode != nil {
                address += place.postalCode! + ", "
            }
            if place.country != nil {
                address += place.country! + ", "
            }
            
            print(address)
            self.lblAddress.text = address
            
        }
    }
}

