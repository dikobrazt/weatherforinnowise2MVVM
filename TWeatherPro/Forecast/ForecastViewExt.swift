//
//  ForecastViewExt.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//


import UIKit



extension ForecastView{
    
    func setUpForecastLabel(){
        forecastLabel.text = "Forecast"
        forecastLabel.textColor = .black
        forecastLabel.font = UIFont.mainText()
    }
}



//MARK: - Table view protocols
extension ForecastView: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastVM?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ForecastCell

        guard let tableViewCell = cell, let forecastVM = forecastVM else {return UITableViewCell() }
        let forecastCellVM = forecastVM.forecastCellViewModel(forIndexPath: indexPath)
        cell?.forecastViewModel = forecastCellVM
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "5 days"
    }
}

