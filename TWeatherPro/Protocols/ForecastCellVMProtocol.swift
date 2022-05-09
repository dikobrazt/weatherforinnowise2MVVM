//
//  ForecastCellVMProtocol.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation



protocol ForecastCellVMProtocol: class{
    var time: String { get }
    var date: String { get }
    var temp: String { get }
    var condition: String { get }
    var imageNum: Int { get }
}

