//
//  Race.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import Foundation
import ObjectMapper

class Race: Mappable {
    var userURL: String?
    var title: String?
    var runnersCount: String?
    var distance: String?
    var difference: String?
    var backgroundURL: String?
    
    private var startDate: String? {
        didSet {
            if let value = startDate  {
                getDateDifference(value)
            }
        }
    }
    required init?(map: Map) {
        mapping(map: map)
    }
    
    
    func mapping(map: Map) {
        userURL <- map["userurl"]
        title <- map["title"]
        runnersCount <- map["runnersCount"]
        distance <- map["distance"]
        startDate <- map["startDate"]
        backgroundURL <- map["background"]
    }
    
    private func getDateDifference(_ timestamp: String) {
        if let t = Double(timestamp) {
            let date = Date(timeIntervalSince1970: t)
            let now = Date()
            let days = now.interval(ofComponent: .day, fromDate: date)
            let hours = now.interval(ofComponent: .hour, fromDate: date)
            difference = "\(days)d \(hours)h"
        }
    }
}
