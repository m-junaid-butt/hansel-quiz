//
//  FriendsCell.swift
//  Hansel
//
//  Created by Muhammad Junaid Butt on 20/11/2018.
//  Copyright © 2018 Hansel LLC. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var imgViewProfilePic: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var btnFollow: UIButton!
    var friend: Friend!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell(withFriend: Friend) {
        self.friend = withFriend
        self.lblFullName.text = withFriend.fullName
        self.lblUsername.text = "@" + withFriend.username
        self.imgViewProfilePic.image = UIImage(named: withFriend.profileImage)
        if withFriend.followed {
            self.btnFollow.setTitle("Unfollow", for: .normal)
            self.btnFollow.setTitleColor(UIColor(hex: Constants.Color.btnUnFollow), for: .normal)
            self.btnFollow.layer.borderColor = UIColor.white.cgColor
            self.btnFollow.layer.borderWidth = 1
            self.btnFollow.layer.cornerRadius = 2
        } else {
            self.btnFollow.setTitle("Follow", for: .normal)
            self.btnFollow.setTitleColor(UIColor(hex: Constants.Color.btnFollow), for: .normal)
            self.btnFollow.layer.borderColor = UIColor(hex: Constants.Color.btnFollow).cgColor
            self.btnFollow.layer.borderWidth = 1
            self.btnFollow.layer.cornerRadius = 2
        }
    }
    
    @IBAction func onBtnFollowTappedAction(_ sender: UIButton) {
        self.friend.followed = !self.friend.followed
        if self.friend.followed {
            self.btnFollow.setTitle("Unfollow", for: .normal)
            self.btnFollow.setTitleColor(UIColor(hex: Constants.Color.btnUnFollow), for: .normal)
            self.btnFollow.layer.borderColor = UIColor.white.cgColor
            self.btnFollow.layer.borderWidth = 1
            self.btnFollow.layer.cornerRadius = 2
        } else {
            self.btnFollow.setTitle("Follow", for: .normal)
            self.btnFollow.setTitleColor(UIColor(hex: Constants.Color.btnFollow), for: .normal)
            self.btnFollow.layer.borderColor = UIColor(hex: Constants.Color.btnFollow).cgColor
            self.btnFollow.layer.borderWidth = 1
            self.btnFollow.layer.cornerRadius = 2
        }
    }
}
