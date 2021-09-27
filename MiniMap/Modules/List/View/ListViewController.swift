//
//  ListViewController.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 22.09.2021.
//
//

import UIKit

class ListViewController: UITableViewController {
    // MARK: - Properties

    var presenter: ViewToPresenterListProtocol?

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
        tableView.dataSource = presenter?.dataSource
        tableView.register(LocationCell.self, forCellReuseIdentifier: String(describing: LocationCell.self))
    }

    private func addSubviews() {}

    private func setupConstraints() {}
}

extension ListViewController: PresenterToViewListProtocol {
    // TODO: Implement View Output Methods
}

extension ListViewController {
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}
