//
//  MainViewExt.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import UIKit



extension MainView{
    
    func setUpMainLabel(){
        mainLabel.text = "TWeather"
        mainLabel.textColor = UIColor.mainTextColor()
        mainLabel.font = UIFont.mainText()
        mainLabel.textAlignment = .center
    }
    
    func setUpCountryLabel(){
        countryLabel.text = "--"
        countryLabel.textColor = UIColor.accent2Color()
        countryLabel.font = UIFont.secondaryBoldText()
        
        countryLabel.textAlignment = .center
    }
    
    func setUpCityLabel(){
        cityLabel.text = "--city--"
        cityLabel.textColor = UIColor.mainTextColor()
        cityLabel.font = UIFont.mainText()
        cityLabel.textAlignment = .center
    }
    
    func setUpConditionLabel(){
        conditionLabel.text = "--conditon--"
        conditionLabel.textColor = UIColor.secondaryTextColor()
        conditionLabel.font = UIFont.secondaryBoldText()
        conditionLabel.textAlignment = .center
    }
    
    func setUpConditionIW(){
        conditionIW.image = UIImage(systemName: "questionmark.circle")
        conditionIW.tintColor = UIColor.accentColor()
    }
    
    func setUpTempLabel(){
        tempLabel.text = "--temp--"
        tempLabel.textColor = UIColor.mainTextColor()
        tempLabel.font = UIFont.mainText()
        tempLabel.textAlignment = .center
    }
    
    func setUpInfoBtn(){
        infoBtn.setTitle("More info", for: .normal)
        infoBtn.backgroundColor = UIColor.accentColor()
        infoBtn.layer.cornerRadius = 25
        infoBtn.titleLabel?.font = UIFont.secondaryBoldText()
        infoBtn.setTitleColor(.white, for: .normal)
    }
    
    func setUpForecastBtn(){
        forecastBtn.setTitle("Forecast", for: .normal)
        forecastBtn.backgroundColor = UIColor.accentColor()
        forecastBtn.layer.cornerRadius = 15
        forecastBtn.titleLabel?.font = UIFont.secondaryBoldText()
        forecastBtn.setTitleColor(.white, for: .normal)
    }
    
    @objc func goToInfoView(){
        let infoView = InfoView(data: mainVM!)
        if let infoCardView = infoView.sheetPresentationController{
            infoCardView.detents = [.medium()]
            infoCardView.prefersGrabberVisible = true
            infoCardView.preferredCornerRadius = 25
        }
        self.present(infoView, animated: true, completion: nil)
    }

    @objc func goToForecastView(){
        let forecastView = ForecastView()
        forecastView.forecastVM = mainVM?.returnForecastVM()
        if let forecastCardView = forecastView.sheetPresentationController{
            forecastCardView.detents = [.large()]
            forecastCardView.prefersGrabberVisible = true
            forecastCardView.preferredCornerRadius = 25
        }
        present(forecastView, animated: true, completion: nil)
    }
}


//MARK: - UPD
extension MainView{
    func updateInterface(with weatherData: MainVM) {
        DispatchQueue.main.async { [self] in
            self.countryLabel.text = mainVM?.country
            self.cityLabel.text = mainVM?.city
            self.conditionLabel.text = mainVM?.condition
            self.tempLabel.text = mainVM?.temp
            if let imageNum = mainVM?.imageNum {
             switch imageNum {
             case 200...232:
                 self.conditionIW.image = UIImage(systemName: "tropicalstorm")
             case 300...321:
                 self.conditionIW.image = UIImage(systemName: "cloud.drizzle")
             case 500...531:
                 self.conditionIW.image = UIImage(systemName: "cloud.rain")
             case 600...622:
                 self.conditionIW.image = UIImage(systemName: "snow")
             case 701...781:
                 self.conditionIW.image = UIImage(systemName: "cloud.fog")
             case 800:
                 self.conditionIW.image = UIImage(systemName: "sun.min")
             case 801...804:
                 self.conditionIW.image = UIImage(systemName: "cloud")
             default:
                 self.conditionIW.image = UIImage(systemName: "questionmark")
             }
             }else{
                 return
             }
         }
    }
    
    
    
//MARK: - Set Up Alert
    func setUpErrorAlert(errorDescription: String){
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: "Problems again(", message: errorDescription, preferredStyle: .actionSheet)
            alertVC.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Settings", style:
            UIAlertAction.Style.cancel, handler: { action in
                
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            }))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
