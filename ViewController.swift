//
//  ViewController.swift
//  Clima
//
//  Created by Александра Савчук on 01.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "location.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "magnifyingglass")
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        let text = UITextField()
        text.text = "Search"
        text.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        text.textColor = .lightGray
        text.textAlignment = .right
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var conditionView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sun.max")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var temperatureLabel1: UILabel = {
        let label = UILabel()
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        return label
    }()
    
    private lazy var temperatureLabel2: UILabel = {
        let label = UILabel()
        label.text = "°"
        label.font = UIFont.systemFont(ofSize: 100, weight: .regular)
        return label
    }()
    
    private lazy var temperatureLabel3: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 100, weight: .regular)
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Moscow"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subviews()
        setupConstraints()
    }
    
    private func subviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(mainStackView)
        mainStackView.addSubview(searchStackView)
        mainStackView.addSubview(conditionView)
        mainStackView.addSubview(temperatureStackView)
        mainStackView.addSubview(cityLabel)
        
        
        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchTextField)
        searchStackView.addArrangedSubview(searchButton)
        temperatureStackView.addArrangedSubview(temperatureLabel1)
        temperatureStackView.addArrangedSubview(temperatureLabel2)
        temperatureStackView.addArrangedSubview(temperatureLabel3)
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
            
//            calculateView.topAnchor.constraint(equalTo: billTotalTextField.bottomAnchor, constant: 40),
//            calculateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            calculateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            calculateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            billTotalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            billTotalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            billTotalLabel.heightAnchor.constraint(equalToConstant: 30),
//
//            billTotalTextField.topAnchor.constraint(equalTo: billTotalLabel.bottomAnchor, constant: 10),
//            billTotalTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            billTotalTextField.heightAnchor.constraint(equalToConstant: 48),
//
//            selectTipLabel.topAnchor.constraint(equalTo: calculateView.topAnchor, constant: 20),
//            selectTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            selectTipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            selectTipLabel.heightAnchor.constraint(equalToConstant: 30),
//
//            percentButtonsStackView.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 20),
//            percentButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            percentButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            percentButtonsStackView.heightAnchor.constraint(equalToConstant: 30),
//
//            chooseSplitLabel.topAnchor.constraint(equalTo: percentButtonsStackView.bottomAnchor, constant: 30),
//            chooseSplitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            chooseSplitLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30),
//
//            splitStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 20),
//            //            splitStackView.widthAnchor.constraint(equalToConstant: 214),
//            splitStackView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: 30),
//            splitStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            splitNumberLabel.widthAnchor.constraint(equalToConstant: 94),
//            splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
//            splitNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
//
//            chooseSplitStepper.widthAnchor.constraint(equalToConstant: 94),
//            chooseSplitStepper.heightAnchor.constraint(equalToConstant: 29),
//            chooseSplitStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
//
//            zeroButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
//            zeroButton.heightAnchor.constraint(equalToConstant: 54),
//            tenButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
//            tenButton.heightAnchor.constraint(equalToConstant: 54),
//            twentyButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
//            twentyButton.heightAnchor.constraint(equalToConstant: 54),
//
//            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            calculateButton.heightAnchor.constraint(equalToConstant: 54)
//        ])
    }
    
}

