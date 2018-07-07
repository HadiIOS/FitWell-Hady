//
//  SegmentTableViewCell.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

class SegmentTableViewCell: UITableViewCell {
    @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var transportaionImageView: UIImageView!
    @IBOutlet weak var transportaionLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func setupCell(_ segment: RaceDetails.Segment) {
        let image = UIImage(named: segment.type ?? "")
        self.transportaionImageView.image = image
        continueView.isHidden = segment.isLast
        self.contentView.viewWithTag(-1)?.isHidden = segment.isFirst
        transportaionLabel.text = segment.title
        timeLabel.text = segment.time
        descLabel.text = segment.desc
    }
}
