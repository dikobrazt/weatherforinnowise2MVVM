//
//  MainVMProtocol.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import Foundation



protocol MainVMProtocol{
    var country: String { get }
    var city: String { get }
    var temp: String { get }
    var condition: String { get }
    var imageNum: Int { get }
    var humidity: String { get }
    var tempMax: String { get }
    var pressure: String { get }
    var wind: String { get }
    var weather: Box<MainModel?> { get }
}
