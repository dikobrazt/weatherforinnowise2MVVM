//
//  ForecastCellVM.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation



class ForecastCellVM: ForecastCellVMProtocol{
    
    private var weatherData: MainModel
   
    
    var time: String{
        return timeFormater(time: weatherData.date)
    }
    
    var date: String{
        return dateFormatter(date: weatherData.date)
    }
    
    var temp: String{
        //guard let temper = weatherData.temp else {return 0}
        return Int(round(weatherData.temp)).description + " °C"
    }
    
    var condition: String{
        return weatherData.condition
    }
    
    var imageNum: Int{
        return weatherData.imageNum
    }
    
    init(weatherData: MainModel) {
        self.weatherData = weatherData
    }
    
    
    
    
}



extension ForecastCellVM{
    
       private func timeFormater (time: String) -> String {
    
            let date: String = time
            let start = date.index(date.startIndex, offsetBy: 11)
            let end = date.index(date.startIndex, offsetBy: 16)
            let range = start..<end
                return String(date[range])
    
        }
    
       private func dateFormatter(date: String) -> String {
    
            let date: String = date
            let start = date.index(date.startIndex, offsetBy: 0)
            let end = date.index(date.endIndex, offsetBy: -9)
            let range = start..<end
            return String(date[range])
    
    }
    
}

