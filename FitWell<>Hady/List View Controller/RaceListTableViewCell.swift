//
//  RaceListTableViewCell.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit
import SDWebImage

class RaceListTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var runnerCountLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateDifferenceLabel: UILabel!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var distanceView: UIView!
    
    func setupCell(_ race: Race) {
        counterView.roundedView(3)
        distanceView.roundedView(3)
        self.distanceLabel.text = "\(race.distance ?? "0") KM"
        self.runnerCountLabel.text = race.runnersCount
        self.titleLabel.text = race.title
        self.dateDifferenceLabel.text = race.difference
        
        if let url = URL(string: race.userURL ?? "") {
            self.userImageView.roundedView(self.userImageView.frame.width / 2)
            self.userImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "Oval 3"))
        }
        
        if let url = URL(string: race.backgroundURL ?? "") {
            self.backgroundImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "BG"))
        }
        
    }
}
