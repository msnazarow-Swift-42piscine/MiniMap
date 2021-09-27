//
//  MapContract.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import MapKit
import UIKit

// MARK: View Output (Presenter -> View)

protocol PresenterToViewMapProtocol: AnyObject {
    func setZoom(for coordinates: CLLocationCoordinate2D)
    func addMapPin(with pin: MKAnnotation)
    func setMapType(type: MKMapType)
}

// MARK: View Input (View -> Presenter)

protocol ViewToPresenterMapProtocol: AnyObject {
    var delegate: PresenterToMapDelegateProtocol? { get }
    func didChangeSegmentedControl(tab: Int)
    func didLocationButtonTapped()
    func viewDidLoad()
}

// MARK: Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorMapProtocol: AnyObject {}

// MARK: Presenter Output (Presenter -> Router)

protocol PresenterToRouterMapProtocol: AnyObject {}

// MARK: Presenter Output (Presenter -> DataSource)

protocol PresenterToMapDelegateProtocol: MKMapViewDelegate {
//    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)

protocol AnnotationToPresenterMapProtocol: AnyObject {
    func getModel(for annotationTitle: String) -> Identifiable?
}

protocol TableViewToMapViewProtocol: AnyObject {
    func addMapPin(_ notification: NSNotification)
}
