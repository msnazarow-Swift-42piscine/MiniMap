//
//  LocationCell.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//

import Foundation

class LocationCell: Cell {
    override func updateViews() {
        guard let model = model as? CellModel else {
            return
        }
        textLabel?.text = model.title
    }
}
