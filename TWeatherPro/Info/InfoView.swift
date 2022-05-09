//
//  InfoView.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import UIKit



class InfoView: UIViewController{
    
//MARK: - Declaration
    let infoLabel = UILabel()
    let windIW = UIImageView()
    let windLabel = UILabel()
    let humidityIW = UIImageView()
    let humidityLabel = UILabel()
    let pressureIW = UIImageView()
    let pressureLabel = UILabel()
    let tempMaxIW = UIImageView()
    let tempMaxLabel = UILabel()
    var mainVM: MainVM = MainVM()
   
//init
    init(data: MainVM){
        self.mainVM = data
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
//addSubviews
        view.backgroundColor = .white
        view.addSubview(infoLabel)
        view.addSubview(windIW)
        view.addSubview(windLabel)
        view.addSubview(humidityIW)
        view.addSubview(humidityLabel)
        view.addSubview(pressureIW)
        view.addSubview(pressureLabel)
        view.addSubview(tempMaxIW)
        view.addSubview(tempMaxLabel)
    }
   
    
    
//MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {

//setUpfuncs
        setUpInfoLabel()
        setUpWindIW()
        setUpWindLabel()
        setUpHumidityIW()
        setUpHumidityLabel()
        setUpPressureIW()
        setUpPressureLabel()
        setUpTempMaxIW()
        setUpTempMaxLabel()
        updateInterface(weatherData: mainVM)
        
//frames

        makeConstraintsInfoLabel()
        makeConstraintsWindIW()
        makeConstraintsWindLabel()
        makeConstraintsHumidityIW()
        makeConstraintsHumidityLabel()
        makeConstraintsPressureIW()
        makeConstraintsPressureLabel()
        makeConstraintsTempMaxIW()
        makeConstraintsTempMaxLabel()
    }
}



//makeConstraints
extension InfoView{
    
    func makeConstraintsInfoLabel(){
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
    }
   
    func makeConstraintsWindIW(){
        windIW.translatesAutoresizingMaskIntoConstraints = false
        windIW.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        windIW.widthAnchor.constraint(equalToConstant: 40).isActive = true
        windIW.heightAnchor.constraint(equalToConstant: 40).isActive = true
        windIW.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
    }
    
    func makeConstraintsWindLabel(){
        windLabel.translatesAutoresizingMaskIntoConstraints = false
        windLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 165).isActive = true
        windLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        windLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        windLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    }
    
    func makeConstraintsHumidityIW(){
        humidityIW.translatesAutoresizingMaskIntoConstraints = false
        humidityIW.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        humidityIW.widthAnchor.constraint(equalToConstant: 40).isActive = true
        humidityIW.heightAnchor.constraint(equalToConstant: 40).isActive = true
        humidityIW.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75).isActive = true
    }
    
    func makeConstraintsHumidityLabel(){
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 165).isActive = true
        humidityLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        humidityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        humidityLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    func makeConstraintsPressureIW(){
        pressureIW.translatesAutoresizingMaskIntoConstraints = false
        pressureIW.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        pressureIW.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pressureIW.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pressureIW.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -75).isActive = true
    }
    
    func makeConstraintsPressureLabel(){
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 295).isActive = true
        pressureLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        pressureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pressureLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    func makeConstraintsTempMaxIW(){
        tempMaxIW.translatesAutoresizingMaskIntoConstraints = false
        tempMaxIW.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        tempMaxIW.widthAnchor.constraint(equalToConstant: 40).isActive = true
        tempMaxIW.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tempMaxIW.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
    }
    
    func makeConstraintsTempMaxLabel(){
        tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        tempMaxLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 295).isActive = true
        tempMaxLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        tempMaxLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tempMaxLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    }
    
}


