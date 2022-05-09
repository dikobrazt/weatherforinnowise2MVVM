//
//  LocationManager.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import Foundation
import CoreLocation

final class LocationManager: NSObject{
    
   private let LM = CLLocationManager()
   private var networkService: Networking = Networking()
    
    func startLM(_ completionHandler: @escaping (MainModel?, String?) -> Void) {
       networkService.completionHandler = completionHandler
      
        LM.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            LM.delegate = self
            LM.desiredAccuracy = kCLLocationAccuracyKilometer
            LM.distanceFilter = 1000
            LM.showsBackgroundLocationIndicator = true
            LM.pausesLocationUpdatesAutomatically = true
            LM.startUpdatingLocation()
        }else{
            completionHandler(nil, "Turn on your location services")
        }
    }
}



//MARK: - Location Delegate ext
extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {return}
            networkService.networking(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
    }
}

