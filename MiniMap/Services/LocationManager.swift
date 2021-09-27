//
//  LocationManager.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()

    private var complition: ((CLLocation) -> Void)?
    private let manager = CLLocationManager()

    public func getUserLocation(complition: @escaping (CLLocation) -> Void) {
        self.complition = complition
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }

    public func resolveLocationName(with location: CLLocation, complition: @escaping ((String?) -> Void)) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                complition(nil)
                return
            }
            var name = ""
            if let locality = place.locality {
                name += locality
            }

            if let administrativeArea = place.administrativeArea {
                name += ", \(administrativeArea)"
            }

            complition(name)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        complition?(location)
        manager.stopUpdatingLocation()
    }
}
