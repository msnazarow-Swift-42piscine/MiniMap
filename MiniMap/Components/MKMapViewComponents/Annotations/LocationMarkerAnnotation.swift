//
//  LocationMarkerAnnotation.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//

import UIKit

class LocationMarkerAnnotation: MarkerAnnotation {

    override func updateViews() {
        guard let model = model as? MarkerAnnotationModel else {
            return
        }
        markerTintColor = UIColor(named: model.colorName)
    }
}
