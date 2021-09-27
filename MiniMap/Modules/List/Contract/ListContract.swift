//
//  ListContract.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//
//

import UIKit

// MARK: View Output (Presenter -> View)

protocol PresenterToViewListProtocol: AnyObject {}

// MARK: View Input (View -> Presenter)

protocol ViewToPresenterListProtocol: AnyObject {
    var dataSource: PresenterToDataSourceListProtocol? { get }
    func viewDidLoad()
    func didSelectRowAt(index: Int)
}

// MARK: Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorListProtocol: AnyObject {}

// MARK: Presenter Output (Presenter -> Router)

protocol PresenterToRouterListProtocol: AnyObject {
    func routeToMapView(with model: Model)
}

// MARK: Presenter Output (Presenter -> DataSource)

protocol PresenterToDataSourceListProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)

protocol CellToPresenterListProtocol: AnyObject {}
