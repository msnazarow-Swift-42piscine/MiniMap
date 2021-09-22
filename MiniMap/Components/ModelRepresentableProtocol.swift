//
//  ModelRepresentableProtocol.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//

import Foundation


protocol ModelRepresentable {
    var model: Identifiable? { get set }
}

protocol Identifiable {
    var identifier: String { get }
}
