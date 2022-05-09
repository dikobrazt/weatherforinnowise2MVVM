//
//  InfoViewExt.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import UIKit


extension InfoView{
    
    func setUpInfoLabel(){
        infoLabel.text = "Detailed info"
        infoLabel.textColor = UIColor.mainTextColor()
        infoLabel.font = UIFont.mainText()

    }
    
    func setUpWindIW(){
        windIW.image = UIImage(systemName: "wind")
        windIW.tintColor = UIColor.accentColor()
    }
    
    func setUpWindLabel(){
        windLabel.text = "--wind--"
        windLabel.textColor = UIColor.mainTextColor()
        windLabel.font = UIFont.secondaryText()
        windLabel.textAlignment = .center
    }
    
    func setUpHumidityIW(){
        humidityIW.image = UIImage(systemName: "humidity")
        humidityIW.tintColor = UIColor.accentColor()
    }
    
    func setUpHumidityLabel(){
        humidityLabel.text = "--humidity--"
        humidityLabel.textColor = UIColor.mainTextColor()
        humidityLabel.font = UIFont.secondaryText()
        humidityLabel.textAlignment = .center
    }
    
    func setUpPressureIW(){
        pressureIW.image = UIImage(systemName: "rectangle.compress.vertical")
        pressureIW.tintColor = UIColor.accentColor()
    }
    
    func setUpPressureLabel(){
        pressureLabel.text = "--pressure--"
        pressureLabel.textColor = UIColor.mainTextColor()
        pressureLabel.font = UIFont.secondaryText()
        pressureLabel.textAlignment = .center
    }
    
    func setUpTempMaxIW(){
        tempMaxIW.image = UIImage(systemName: "sun.max")
        tempMaxIW.tintColor = UIColor.accentColor()
    }
    
    func setUpTempMaxLabel(){
        tempMaxLabel.text = "--maxTemp--"
        tempMaxLabel.textColor = UIColor.mainTextColor()
        tempMaxLabel.font = UIFont.secondaryText()
        tempMaxLabel.textAlignment = .center
    }
    
    
}



//MARK: - UPD Interface ext
extension InfoView{
    
    func updateInterface(weatherData: MainVM){
        DispatchQueue.main.async{ [self] in
            self.windLabel.text = mainVM.wind
            self.humidityLabel.text = mainVM.humidity
            self.tempMaxLabel.text = mainVM.tempMax
            self.pressureLabel.text = mainVM.pressure
        }
    }
}
