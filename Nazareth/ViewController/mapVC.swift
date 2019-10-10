//
//  mapVC.swift
//  Nazareth
//
//  Created by Farido on 9/22/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
//import MapKit
import GoogleMaps

class mapVC: UIViewController {
    
    
    @IBOutlet weak var viewForGoogleMap: GMSMapView!
    var singleItem: prodectData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude:  Double(singleItem?.lat ?? "0.0") ?? 0.0, longitude: Double(singleItem?.lng ?? "0.0") ?? 0.0, zoom: 20.0)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        viewForGoogleMap.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Double(singleItem?.lat ?? "0.0") ?? 0.0, longitude: Double(singleItem?.lng ?? "0.0") ?? 0.0)
        marker.title = singleItem?.name
        marker.snippet = singleItem?.address
        marker.map = mapView
        
    }
    @IBAction func showRoutBTN(_ sender: Any) {
        if let UrlNavigation = URL.init(string: "comgooglemaps://") {
                if UIApplication.shared.canOpenURL(UrlNavigation){
                    if self.singleItem?.lat != nil && self.singleItem?.lng != nil {

                        let lat = (self.singleItem?.lat)
                        let longi = (self.singleItem?.lng)

                        if let urlDestination = URL.init(string: "comgooglemaps://?saddr=&daddr=\(lat ?? "0.0"),\(longi ?? "0.0")&directionsmode=driving") {
                            UIApplication.shared.openURL(urlDestination)
                            print(self.singleItem?.lat)
                        }
                    }
                }
                else {
                    NSLog("Can't use comgooglemaps://");
                    self.openTrackerInBrowser()

                }
            }
            else
            {
                NSLog("Can't use comgooglemaps://");
               self.openTrackerInBrowser()
            }



        }
        func openTrackerInBrowser(){
             if self.singleItem?.lat != nil && self.singleItem?.lng != nil {

                                   let lat = (self.singleItem?.lat)
                                   let longi = (self.singleItem?.lng)

                if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(lat ?? "0.0"),\(longi ?? "0.0")&directionsmode=driving") {
                    UIApplication.shared.openURL(urlDestination)
                }
            }
    }
}


