//
//  MapTableViewCell.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
    @IBOutlet weak var mapView: MKMapView!
    
    func setupCell(_ race: RaceDetails) {
        if let lat = race.lat, let long = race.long {
            let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: false)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            mapView.addAnnotation(annotation)
        }
    }
}
