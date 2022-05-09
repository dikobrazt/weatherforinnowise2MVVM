//
//  ColorExt.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 9.05.22.
//


import UIKit



extension UIColor{
    
    static func secondaryTextColor() -> UIColor?{
        return UIColor(red: 77.0/255.0, green: 80.0/255.0, blue: 69.0/255.0, alpha: 1)
    }
    
    static func accentColor() -> UIColor?{
        return UIColor(red: 58.0/255.0, green: 134.0/255.0, blue: 255.0/255.0, alpha: 1)
    }
    
    static func accent2Color() -> UIColor?{
        return UIColor(red: 255.0/255.0, green: 190.0/255.0, blue: 11.0/255.0, alpha: 1)
    }
    
    static func mainTextColor() -> UIColor?{
        return UIColor(red: 2.0/255.0, green: 17.0/255.0, blue: 27.0/255.0, alpha: 1)
    }
}
