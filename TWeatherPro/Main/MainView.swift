//
//  MainView.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import UIKit




class MainView: UIViewController {
    
//MARK: - Declaration
    let forecastBtn = UIButton()
    let infoBtn = UIButton()
    let mainLabel = UILabel()
    let countryLabel = UILabel()
    let conditionIW = UIImageView()
    let tempLabel = UILabel()
    let cityLabel = UILabel()
    let conditionLabel = UILabel()
    var mainVM: MainVM? = MainVM()
    var net: Networking = Networking()
   // var loc = LocationManager()
    var completionHandler: ((String) -> Void)?
    
    
   
    

    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       //addSubview
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        view.addSubview(countryLabel)
        view.addSubview(conditionIW)
        view.addSubview(tempLabel)
        view.addSubview(cityLabel)
        view.addSubview(conditionLabel)
        view.addSubview(forecastBtn)
        //addTarget
        forecastBtn.addTarget(self, action: #selector(goToForecastView), for: .touchUpInside)
        view.addSubview(infoBtn)
        infoBtn.addTarget(self, action: #selector(goToInfoView), for: .touchUpInside)
        //print(mainVM?.weather1)

    }
    
    
    
//MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        mainVM?.getWeather()

//        set up funcs
        setUpForecastBtn()
        setUpMainLabel()
        setUpCountryLabel()
        setUpConditionIW()
        setUpInfoBtn()
        setUpCityLabel()
        setUpTempLabel()
        setUpConditionLabel()
        
       // setUpUIElements
        makeConstraintsMainLabel()
        makeConstraintsCountryLabel()
        makeConstraintsCityLabel()
        makeConstraintsConditionLabel()
        makeConstraintsConditionIW()
        makeConstraintsTempLabel()
        makeConstraintsInfoBtn()
        makeConstraintsForecastBtn()
        
//data binding funcs
            mainVM?.weather.bind{ [unowned self] in
                
                guard $0 != nil else {return}

                guard mainVM != nil else {return}
                //print("wer")
                updateInterface(with: mainVM!)
            }
            
            mainVM?.errorDescription.bind{ [unowned self] in
                guard $0 != nil else {return}
                guard mainVM != nil else {return}
                setUpErrorAlert(errorDescription: mainVM?.error ?? "Something went wrong. Try later.")
            }
    }
}



//makeConstraints
extension MainView{
   
    func makeConstraintsMainLabel(){
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
    }
   
    func makeConstraintsCountryLabel(){
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        countryLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        countryLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
    }
    
    func makeConstraintsCityLabel(){
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeConstraintsConditionLabel(){
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        conditionLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        conditionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        conditionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeConstraintsConditionIW(){
        conditionIW.translatesAutoresizingMaskIntoConstraints = false
        conditionIW.widthAnchor.constraint(equalToConstant: 170).isActive = true
        conditionIW.heightAnchor.constraint(equalToConstant: 170).isActive = true
        conditionIW.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        conditionIW.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func makeConstraintsTempLabel(){
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeConstraintsInfoBtn(){
        infoBtn.translatesAutoresizingMaskIntoConstraints = false
        infoBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        infoBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        infoBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        infoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeConstraintsForecastBtn(){
        forecastBtn.translatesAutoresizingMaskIntoConstraints = false
        forecastBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        forecastBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        forecastBtn.heightAnchor.constraint(equalToConstant: 70).isActive = true
        forecastBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

