//
//  ListRouter.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//
//

import UIKit

class ListRouter: PresenterToRouterListProtocol {
    // MARK: - Properties

    weak var view: UIViewController?

    // MARK: - Init

    init(view: UIViewController) {
        self.view = view
    }

    func routeToMapView(with _: Model) {
        view?.tabBarController?.selectedIndex = 0
    }
}
