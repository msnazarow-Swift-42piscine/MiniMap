//
//  MapViewController.swift
//  MiniMap
//
//  Created by out-nazarov2-ms on 21.09.2021.
//  
//

import UIKit
import MapKit
class MyPin: MKAnnotationView {

}
class MapViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterMapProtocol?

    let mapView = MKMapView()

    let locationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "scope"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(didLocationButtonTapped), for: .touchUpInside)
        return button
    }()

    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Standart", "Satelite", "Hybrid"])
        sc.selectedSegmentIndex = 0
        sc.backgroundColor = .white
        sc.tintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: #colorLiteral(red: 0.1042267896, green: 0.635617626, blue: 0.9647058824, alpha: 1), .font: UIFont.systemFont(ofSize: 15)], for: .normal)
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.1042267896, green: 0.635617626, blue: 0.9647058824, alpha: 1)
        sc.accessibilityIgnoresInvertColors = true
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(didChangeSegmentedControl), for: .valueChanged)
        return sc
    }()

    // MARK: - Lifecycle Methods
    override func loadView() {
        view = mapView
        mapView.showsUserLocation = true
        mapView.delegate = presenter?.delegate
        mapView.register(LocationMarkerAnnotation.self, forAnnotationViewWithReuseIdentifier: String(describing: LocationMarkerAnnotation.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(segmentedControl)
        view.addSubview(locationButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            segmentedControl.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            locationButton.leadingAnchor.constraint(equalTo: segmentedControl.trailingAnchor, constant: 5),
            locationButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor),
            locationButton.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor),
            locationButton.heightAnchor.constraint(equalTo: locationButton.widthAnchor)
        ])

    }

    @objc private func didChangeSegmentedControl(_ sender: UISegmentedControl) {
        presenter?.didChangeSegmentedControl(tab: sender.selectedSegmentIndex)
    }

    @objc private func didLocationButtonTapped() {
        presenter?.didLocationButtonTapped()
    }


 
}

extension MapViewController: PresenterToViewMapProtocol{
    // TODO: Implement View Output Methods
    func setMapType(type: MKMapType) {
        mapView.mapType = type
    }

    func addMapPin(with pin: MKAnnotation){
        mapView.addAnnotation(pin)
    }

    func setZoom(for coordinates: CLLocationCoordinate2D) {
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
}


