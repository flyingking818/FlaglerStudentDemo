//
//  ViewController.swift
//  Flagler Student
//
//  Created by Jeremy Wang on 1/25/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var welcomeMsg: UILabel!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func mapSearchButton(_ sender: UIButton) {
        
        let geocoder = CLGeocoder() //object instantiation - the black box for translation address into geo coordinates.
        if let address = addressTextField.text {
            geocoder.geocodeAddressString(address) { [weak self] (placemarks, error) in
                if let placemark = placemarks?.first, let location = placemark.location {
                    let coordinate = location.coordinate
                    self?.mapView.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: true)
                }
            }
        }
        
        
        
    }
    
    
    
}

