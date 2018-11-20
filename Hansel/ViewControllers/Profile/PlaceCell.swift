//
//  PlaceCell.swift
//  Hansel
//
//  Created by Muhammad Junaid Butt on 20/11/2018.
//  Copyright © 2018 Hansel LLC. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet weak var imgViewBanner: UIImageView!
    @IBOutlet weak var lblSpotsCount: UILabel!
    @IBOutlet weak var imgViewCountryIcon: UIImageView!
    @IBOutlet weak var lblCountryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.lblSpotsCount.layer.cornerRadius = 2
    }
}
