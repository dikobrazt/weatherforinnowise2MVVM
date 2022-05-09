//
//  MainVM.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation
import CoreLocation


class MainVM: MainVMProtocol{
    
    var weatherData: MainModel?
    private var locationManager: LocationManager = LocationManager()
    var weather: Box<MainModel?> = Box(value: nil)
    var errorDescription: Box<String?> = Box(value: nil)
    var error: String = ""
    
    var country: String{
        return weatherData?.country ?? " "
    }
    
    var city: String{
        return weatherData?.city ?? " "

    }
    
    var temp: String{
        return  Int(round(weatherData?.temp ?? 0 - 273)).description + "°C"
    }
    
    var condition: String{
        return weatherData?.condition ?? " "
    }
    
    var imageNum: Int{
        return weatherData?.imageNum ?? 0
    }
    var humidity: String{
         return (weatherData?.humidity ?? 0).description + " Pa"
    }
    
    var tempMax: String{
       return Int(round(weatherData?.tempMax ?? 0 - 273)).description + " °C"
    }
    
    var pressure: String{
        return (weatherData?.pressure ?? 0).description + " %"
    }
    
    var wind: String{
        return (weatherData?.wind ?? 0).description + " m/s"
    }
}



extension MainVM{
    
    func getWeather(){
        self.locationManager.startLM { [weak self] weather1, error in
            if weather1 != nil{
                self?.weatherData = weather1
                self?.weather.value = weather1
            }else{
                self?.error = error ?? "We have some problems"
                self?.errorDescription.value = error ?? "We have some problems"
            }
        }
    }
    
    func returnForecastVM() -> ForecastVMProtocol? {
        guard let data = weatherData else { return nil }
        return ForecastVM(data: data)
    }
    
    
    
}
