//
//  ListPresenter.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//
//

import Foundation

class ListPresenter: ViewToPresenterListProtocol {
    // MARK: Properties

    weak var view: PresenterToViewListProtocol?
    let interactor: PresenterToInteractorListProtocol?
    let router: PresenterToRouterListProtocol?
    let dataSource: PresenterToDataSourceListProtocol?
    weak var delegate: TableViewToMapViewProtocol?

    let models = [
        Model(latitude: 55.7514952, longitude: 37.618153095505875, title: "Кремль", subTitle: "Тут сидит дед"),
        Model(latitude: 55.699941800000005, longitude: 37.58020037032628, title: "Сбер", subTitle: "Тут Курпатыч лечит Грефа"),
        Model(latitude: 55.7602677, longitude: 37.6275375, title: "ФСБ", subTitle: "Тут любят шпили"),
        Model(latitude: 56.29778575, longitude: 39.39712418110359, title: "СИЗО-3", subTitle: "Тут сидит Навальный"),
        Model(latitude: 55.797129, longitude: 37.579789, title: "Школа 21", subTitle: "Кеки и рофлы без смс и регистрации"),
    ]

    // MARK: Init

    init(view: PresenterToViewListProtocol,
         interactor: PresenterToInteractorListProtocol?,
         router: PresenterToRouterListProtocol?,
         dataSource: PresenterToDataSourceListProtocol?)
    {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad() {
        dataSource?.updateForSections([SectionModel(models)])
        models.forEach { NotificationCenter.default.post(name: .pinAdded, object: $0) }
    }

    func didSelectRowAt(index: Int) {
        NotificationCenter.default.post(name: .locationSelected, object: models[index])
        router?.routeToMapView(with: models[index])
    }
}

extension ListPresenter: CellToPresenterListProtocol {}
