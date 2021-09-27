//
//  CellModel.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import Foundation

struct Model {
    let latitude: Double
    let longitude: Double
    let title: String
    let subTitle: String
}

struct CellModel: CellIdentifiable {
    var identifier: String { return "LocationCell" }
    let title: String

    init(_ property: Model) {
        title = property.title
    }
}
