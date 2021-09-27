//
//  MarkerAnnotationModel.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import Foundation

struct AnnotationModel {
    let colorName: String
}

struct MarkerAnnotationModel: Identifiable {
    var identifier: String { return "LocationMarkerAnnotation" }
    let colorName: String

    init(_ property: AnnotationModel) {
        colorName = property.colorName
    }
}
