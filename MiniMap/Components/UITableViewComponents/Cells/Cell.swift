//
//  Cell.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import UIKit

class Cell: UITableViewCell, ModelRepresentable {
    weak var presenter: CellToPresenterListProtocol?

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
