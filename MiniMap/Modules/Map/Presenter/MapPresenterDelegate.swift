//
//  MapPresenterDelegate.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import MapKit

class MapPresenterDelegate: NSObject, PresenterToMapDelegateProtocol {
    // MARK: Properties

    weak var presenter: AnnotationToPresenterMapProtocol?

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: String(describing: LocationMarkerAnnotation.self), for: annotation) as? MarkerAnnotation, !annotation.isEqual(mapView.userLocation) else { return nil }
        if case let title?? = annotationView.annotation?.title, let model = presenter?.getModel(for: title) {
            annotationView.model = model
        }
        return annotationView
    }
}
