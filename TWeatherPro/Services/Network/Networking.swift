//
//  Networking.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import Foundation



final class Networking{
    
    private var weatherData = WeatherData()
    private let API_KEY: String = "fb4c711f11bed78b124e2b22d74d9792"
    var completionHandler: ((MainModel?, String?) -> Void)?
    
    func networking(latitude: Double, longitude: Double) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude.description)&lon=\(longitude.description)&lang=ru&appid=\(API_KEY)&units=metric")
            
            if url != nil{
                let session = URLSession.shared
                let task = session.dataTask(with: url!) { data, response, error in
                    if error == nil{
                        do{
                            self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                            self.completionHandler?(MainModel.init(weatherData: self.weatherData), nil)
                        }catch{
                            self.completionHandler?(nil, error.localizedDescription)
                        }
                    }else{
                        self.completionHandler?(nil, error?.localizedDescription)
                        return
                    }
                }
                task.resume()
            }else{
                self.completionHandler?(nil, "Turn on your internet")
            }
     }
}


