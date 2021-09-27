//
//  MiniMapTabBarController.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//

import UIKit

class MiniMapTabBarController: UITabBarController {
//    let tbc = UITabBarController()
    let vc1: UIViewController = {
        let vc = MapAssembly.createModule()
        vc.title = "Map"
        return vc
    }()

    let vc2: UIViewController = {
        let vc = ListAssembly.createModule()
        vc.title = "List"
        return vc
    }()

    let vc3: UIViewController = {
        let vc = MoreViewController()
        vc.title = "More"
        return vc
    }()
    let imageNames = ["map", "list.stars", "ellipsis"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([vc1, vc2, vc3], animated: true)
        selectedIndex = 1
        tabBar.items?[0].image = UIImage(named: "map")
        tabBar.items?[1].image = UIImage(systemName: "list.star")
        tabBar.items?[2].image = UIImage(named: "more")
        // Do any additional setup after loading the view.
    }
}

//        let vc3 = MapAssembly.createModule()
//        vc3.view.backgroundColor = .blue
//        vc3.title = "More"
//        tbc.setViewControllers([vc1, vc2, vc3], animated: true)
//        tbc.tabBar.items?[2].image = UIImage(named: "more")
