//
//  RaceDetails.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import Foundation
import ObjectMapper

class RaceDetails: Mappable {
    var name: String?
    var userURL: String?
    var location: String?
    var isValid: Bool?
    var lat: Double?
    var long: Double?
    var totaltime: String?
    var totalCal: String?
    var totalKM: String?
    var segments: [Segment]?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["username"]
        userURL <- map["userurl"]
        location <- map["location"]
        isValid <- map["isValid"]
        lat <- map["lat"]
        long <- map["lon"]
        totaltime <- map["totaltime"]
        totalKM <- map["totalKM"]
        totalCal <- map["totalCAL"]
        segments <- map["segments"]
    }
    
    class Segment: Mappable {
        var type: String?
        var title: String?
        var desc: String?
        var time: String?
        
        var isFirst: Bool = false
        var isLast: Bool = false
        
        required init?(map: Map) {
            mapping(map: map)
        }
        
        func mapping(map: Map) {
            type <- map["type"]
            title <- map["title"]
            time <- map["time"]
            desc <- map["desc"]
        }

    }
}
