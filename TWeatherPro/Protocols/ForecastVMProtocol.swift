//
//  ForecastVMProtocol.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import Foundation



protocol ForecastVMProtocol{
    func numberOfRows() -> Int
    func forecastCellViewModel(forIndexPath indexPath: IndexPath) -> ForecastCellVMProtocol?
}
