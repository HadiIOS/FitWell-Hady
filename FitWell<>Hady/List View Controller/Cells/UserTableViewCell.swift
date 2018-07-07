//
//  UserTableViewCell.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var isValidImageView: UIImageView!
    
    func setupCell(_ race: RaceDetails) {
        self.userNameTitle.text = race.name
        self.locationTitle.text = race.location
        self.isValidImageView.isHidden = !(race.isValid == true)
        if let url = URL(string: race.userURL ?? "") {
            self.userProfileImageView.roundedView(self.userProfileImageView.frame.width / 2)
            self.userProfileImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "Oval 3"))
        }
    }
}
