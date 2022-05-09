//
//  Box.swift
//  TWeatherPro
//
//  Created by Vladislav Tuleiko on 7.05.22.
//

import Foundation



class Box<T>{
    
    typealias Observer = (T) -> ()
    var observer: Observer?
    
    var value: T {
        didSet{
           observer?(value)
        }
    }
    
    func bind(observer: @escaping Observer){
        self.observer = observer
        observer(value)
    }
    
    init(value: T) {
        self.value = value
    }
}

