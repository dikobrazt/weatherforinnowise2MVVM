//
//  ForecastVM.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation


class ForecastVM: ForecastVMProtocol{
    
    init(data: MainModel) {
        self.mainModel = data
    }
    
    var mainModel: MainModel
  
    func numberOfRows() -> Int {
        return 39
    }
    
    func forecastCellViewModel(forIndexPath indexPath: IndexPath) -> ForecastCellVMProtocol? {
        return ForecastCellVM(weatherData: mainModel)
    }
}
