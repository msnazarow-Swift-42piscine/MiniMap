//
//  Cell.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//  
//

import MapKit

class MarkerAnnotation: MKMarkerAnnotationView, ModelRepresentable {
//    weak var presenter: AnnotationToPresenterListProtocol?

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
