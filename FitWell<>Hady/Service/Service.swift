//
//  Service.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import Foundation

class Service {
    func getRaces(completion: (_ races: [Race]?, _ isError: Bool) -> ()) {
        if let path = Bundle.main.path(forResource: "races", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String: String]] {
                    var races: [Race] = []
                    jsonResult.forEach { (object) in
                        if let race = Race(JSON: object) {
                            races.append(race)
                        }
                    }
                    
                    completion(races, false)
                }
            } catch {
                completion(nil, true)
            }
        }
    }
    
    func getRaceDetails(completion: (_ races: RaceDetails?, _ isError: Bool) -> ()) {
        if let path = Bundle.main.path(forResource: "getDetails", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String: Any] {
                    let race = RaceDetails(JSON: jsonResult)
                    completion(race, false)
                }
            } catch {
                completion(nil, true)
            }
        }
    }
}
