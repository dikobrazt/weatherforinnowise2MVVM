//
//  ForecastView.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import UIKit


class ForecastView: UIViewController {
    
//MARK: - Declaration
    
    let forecastLabel = UILabel()
    let forecastTableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellID: String = "cellID"
    var forecastVM: ForecastVMProtocol?
    
    
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
//addSubviews
        view.backgroundColor = .white
        view.addSubview(forecastLabel)
        view.addSubview(forecastTableView)
        
//registerCell
        forecastTableView.register(UINib(nibName: "ForecastCell", bundle: nil), forCellReuseIdentifier: cellID)
        
//tableViewProtocols
        forecastTableView.dataSource = self
        forecastTableView.delegate = self
        
        
    }
    
    
    
//MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
//        funcs
        setUpForecastLabel()
       
//        frames
        forecastLabel.frame = .init(x: 20, y: 35, width: 300, height: 50)
        
        forecastTableView.translatesAutoresizingMaskIntoConstraints = false
        self.forecastTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        forecastTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.forecastTableView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        self.forecastTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
   }
}

