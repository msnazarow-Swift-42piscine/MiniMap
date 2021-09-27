//
//  MiniMapContract.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//
//

import UIKit

var verticalTranslation = UIApplication.shared.statusBarOrientation.isPortrait ? UIScreen.main.bounds.height / 844.0 : UIScreen.main.bounds.height / 390.0
var horisontalTranslation = UIApplication.shared.statusBarOrientation.isPortrait ? UIScreen.main.bounds.width / 390.0 : UIScreen.main.bounds.width / 844.0
