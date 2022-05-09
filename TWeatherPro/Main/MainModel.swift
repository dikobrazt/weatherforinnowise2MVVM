//
//  MainModel.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation


class MainModel: MainModelProtocol{
   
    var country: String
    
    var city: String
    
    var temp: Double
    
    var condition: String
    
    var imageNum: Int
    
    var wind: Double
    
    var humidity: Int
    
    var tempMax: Double
    
    var pressure: Int
    
    var date: String
    
init(weatherData: WeatherData) {
        country = weatherData.city.country
        city = weatherData.city.name
        temp = weatherData.list.first?.main.temp ?? 0
        condition = weatherData.list.first?.weather.last?.description ??  "--condition--"
        imageNum = weatherData.list.first?.weather.last?.id ?? 0
        wind = weatherData.list.first?.wind.speed ?? 0
        humidity = weatherData.list.first?.main.humidity ?? 0
        tempMax = weatherData.list.first?.main.temp_max ?? 0
        pressure = weatherData.list.first?.main.pressure ?? 0
        date = weatherData.list.first?.dt_txt ?? " "
    }
}

