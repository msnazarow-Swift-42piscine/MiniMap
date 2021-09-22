//
//  ListAssembly.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//  
//

import UIKit

enum ListAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = ListViewController()
        let router = ListRouter(view: viewController)
        let interactor = ListInteractor()
        let dataSource = ListPresenterDataSource()
        let presenter = ListPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
