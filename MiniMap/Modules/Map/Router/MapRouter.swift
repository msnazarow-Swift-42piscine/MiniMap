//
//  MapRouter.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//  
//

import UIKit

class MapRouter: PresenterToRouterMapProtocol {

    // MARK: - Properties
    weak var view: UIViewController?

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
}
