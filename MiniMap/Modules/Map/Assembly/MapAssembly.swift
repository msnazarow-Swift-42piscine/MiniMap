//
//  MapAssembly.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//  
//

import UIKit

enum MapAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = MapViewController()
        let router = MapRouter(view: viewController)
        let interactor = MapInteractor()
        let delegate = MapPresenterDelegate()
        let presenter = MapPresenter(view: viewController, interactor: interactor, router: router, delegate: delegate)

        viewController.presenter = presenter
        delegate.presenter = presenter

        return viewController
    }
}
