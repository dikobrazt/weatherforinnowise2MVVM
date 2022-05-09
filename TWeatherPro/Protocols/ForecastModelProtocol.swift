//
//  ForecastModelProtocol.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation



protocol ForecastModelProtocol: class{
    var temp: Double { get }
    var condition: String { get }
    var imageNum: Int { get }
    var date: String { get }
}

