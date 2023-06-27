//
//  ViewController.swift
//  Clima
//
//  Created by Александра Савчук on 01.05.2023.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(
            pointSize: 40, weight: .medium, scale: .default)
        let image = UIImage(systemName: "location.circle.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "ColorText")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(
            pointSize: 40, weight: .medium, scale: .default)
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "ColorText")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        let text = UITextField()
        text.text = "Search"
        text.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        text.textColor = .lightGray
        text.textAlignment = .right
        text.autocapitalizationType = .words
        text.returnKeyType = .go
        text.backgroundColor = .placeholderText
        text.layer.cornerRadius = 5
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var conditionView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "sun.max")
        view.tintColor = UIColor(named: "ColorText")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var temperatureLabel1: UILabel = {
        let label = UILabel()
        label.text = "21"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel2: UILabel = {
        let label = UILabel()
        label.text = "°"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel3: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.textColor = UIColor(named: "ColorText")
        label.font = UIFont.systemFont(ofSize: 100, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Moscow"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textColor = UIColor(named: "ColorText")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        subviews()
        setupConstraints()
    }
    
    private func subviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(searchStackView)
        backgroundView.addSubview(conditionView)
        backgroundView.addSubview(temperatureStackView)
        backgroundView.addSubview(cityLabel)
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        temperatureStackView.addArrangedSubview(temperatureLabel1)
        temperatureStackView.addArrangedSubview(temperatureLabel2)
        temperatureStackView.addArrangedSubview(temperatureLabel3)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            searchStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchStackView.bottomAnchor.constraint(equalTo: searchButton.bottomAnchor),

            locationButton.leadingAnchor.constraint(equalTo: searchStackView.leadingAnchor),
            locationButton.topAnchor.constraint(equalTo: searchStackView.topAnchor),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            
            searchTextField.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 10),
            
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: searchStackView.trailingAnchor),
            searchButton.topAnchor.constraint(equalTo: searchStackView.topAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            
            conditionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            conditionView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 10),
            conditionView.heightAnchor.constraint(equalToConstant: 120),
            conditionView.widthAnchor.constraint(equalToConstant: 120),
            
            temperatureStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            temperatureStackView.topAnchor.constraint(equalTo: conditionView.bottomAnchor, constant: 10),
            temperatureLabel1.centerYAnchor.constraint(equalTo: temperatureLabel3.centerYAnchor),
            
            cityLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            cityLabel.topAnchor.constraint(equalTo: temperatureStackView.bottomAnchor, constant: 10)
        ])
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    @objc func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel1.text = weather.temperatureString
            self.conditionView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    @objc func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
