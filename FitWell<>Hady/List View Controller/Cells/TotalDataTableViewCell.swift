//
//  TotalDataTableViewCell.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

class TotalDataTableViewCell: UITableViewCell {
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var totalKMLabel: UILabel!
    @IBOutlet weak var totalCalLabel: UILabel!
    
    func setupCell(_ race: RaceDetails) {
        self.totalTimeLabel.text = race.totaltime
        self.totalKMLabel.text = race.totalKM
        self.totalCalLabel.text = race.totalCal
    }
}
