//
//  Font Ext.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 9.05.22.
//


import UIKit



extension UIFont{
    
    static func mainText() -> UIFont?{
        return UIFont(name: "Helvetica Neue Bold", size: 35)
    }
    
    static func secondaryBoldText() -> UIFont?{
        return UIFont(name: "Helvetica Neue Bold", size: 25)
    }
    
    static func secondaryText() -> UIFont?{
        return UIFont(name: "Helvetica Neue Regular", size: 25)
    }
    
    static func lightText() -> UIFont?{
        return UIFont(name: "Helvetica Neue Light Italic", size: 12 )
    }
}
