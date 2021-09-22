//
//  MapPresenter.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//  
//

import Foundation
import MapKit

class MapPresenter: NSObject, ViewToPresenterMapProtocol {

    // MARK: Properties
    weak var view: PresenterToViewMapProtocol?
    let interactor: PresenterToInteractorMapProtocol?
    let router: PresenterToRouterMapProtocol?
    let delegate: PresenterToMapDelegateProtocol?
    let annotationColors = ["Школа 21": "green", "Сбер": "blue"]

    // MARK: Init
    init(view: PresenterToViewMapProtocol,
         interactor: PresenterToInteractorMapProtocol?,
         router: PresenterToRouterMapProtocol?,
         delegate: PresenterToMapDelegateProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }

    func viewDidLoad(){
        NotificationCenter.default.addObserver(self, selector: #selector(locationSelected), name: .locationSelected, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addMapPin), name: .pinAdded, object: nil)
//
//        LocationManager.shared.getUserLocation { [self] (location) in
//                addMapPin(with: location)
//        }
//        view?.setZoom(for: CLLocationCoordinate2D())
    }



    func didChangeSegmentedControl(tab: Int) {
        switch tab {
        case 0:
            view?.setMapType(type: .standard)
        case 1:
            view?.setMapType(type: .satellite)
        case 2:
            view?.setMapType(type: .hybrid)
        default:
            break
        }
    }

    func didLocationButtonTapped() {
        LocationManager.shared.getUserLocation { [self] (location) in
            DispatchQueue.main.async {
                self.view?.setZoom(for: location.coordinate)
            }
        }
    }

    @objc func locationSelected(_ notification: NSNotification){
        guard let location = notification.object as? Model else { return }
        DispatchQueue.main.async {
            self.view?.setZoom(for: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
        }
    }

}

extension MapPresenter: AnnotationToPresenterMapProtocol {
    func getModel(for annotationTitle: String) -> Identifiable?{
        if let colorName = annotationColors[annotationTitle] {
            return MarkerAnnotationModel(AnnotationModel(colorName: colorName))
        }   else {
            return nil
        }
    }
}

extension MapPresenter: TableViewToMapViewProtocol {
    @objc func addMapPin(_ notification: NSNotification){
        guard let location = notification.object as? Model else {
            return
        }
        let pin = MKPointAnnotation()
        pin.title = location.title
        pin.subtitle = location.subTitle
        pin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        if pin.title == "Школа21" {

        }
        DispatchQueue.main.async {
            self.view?.addMapPin(with: pin)
//            self.view?.setZoom(for: pin.coordinate)
        }
    }
}

/*
if CLLocationManager.locationServicesEnabled() {

} else {
    let alert: UIAlertController = {
        let alert = UIAlertController(title: "У вас выключена служба геолокации", message: "Хотите включить?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Настройки", style: .default, handler: {_ in
            if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        return alert
    }()
    present(alert, animated: true, completion: nil)
}

     func checkAutorization() {
         switch CLLocationManager.authorizationStatus() {
         case .authorizedAlways:
             view.showUserLocation()
         case .authorizedWhenInUse:
             break
         case .denied:
             break
         case .restricted:
             break
         case .notDetermined:
             view.requestUserLocation()
         default:
             break
         }
     }
*/
