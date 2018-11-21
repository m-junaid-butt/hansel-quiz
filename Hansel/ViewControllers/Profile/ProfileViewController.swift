//
//  ProfileViewController.swift
//  Hansel
//
//  Created by Muhammad Junaid Butt on 20/11/2018.
//  Copyright © 2018 Hansel LLC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    static func instantiateViewController() -> ProfileViewController {
        let name = String(describing: ProfileViewController.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name) as! ProfileViewController
        return viewController
    }
    
    //IBOutlets
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var lblUserFullName: UILabel!
    @IBOutlet weak var lblPlaces: UILabel!
    @IBOutlet weak var viewPlacesDot: UIView!
    @IBOutlet weak var lblFavorites: UILabel!
    @IBOutlet weak var viewFavoritesDot: UIView!
    @IBOutlet weak var lblFriends: UILabel!
    @IBOutlet weak var viewFriendsDot: UIView!
    @IBOutlet weak var viewPlaces: UIView!
    @IBOutlet weak var btnAddPlace: UIButton!
    @IBOutlet weak var tblViewPlaces: UITableView!
    @IBOutlet weak var viewFavorites: UIView!
    @IBOutlet weak var btnExplore: UIButton!
    @IBOutlet weak var viewFriends: UIView!
    @IBOutlet weak var tblViewFriends: UITableView!
    
    //Array to hold place & friend data
    private var places = [Place]()
    private var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set separator, footer and delegates of Table Views
        self.tblViewPlaces.separatorStyle = .none
        self.tblViewPlaces.tableFooterView = UIView()
        self.tblViewPlaces.allowsSelection = false
        self.tblViewPlaces.delegate = self
        self.tblViewPlaces.dataSource = self
        self.tblViewPlaces.showsVerticalScrollIndicator = false
        
        self.tblViewFriends.separatorStyle = .none
        self.tblViewFriends.tableFooterView = UIView()
        self.tblViewFriends.allowsSelection = false
        self.tblViewFriends.delegate = self
        self.tblViewFriends.dataSource = self
        self.tblViewFriends.showsVerticalScrollIndicator = false
        
        //by default show Places view
        self.onBtnPlacesTappedAction(self.btnAddPlace)
        
        //Dummy Data for Places
        self.places.append(Place(country: "Paris", noOfSpots: 3, bannerImage: "banner-paris",
                                 countryIcon: "City Icon_Paris_White"))
        self.places.append(Place(country: "Tokyo", noOfSpots: 5, bannerImage: "banner-tokyo",
                                 countryIcon: "City Icon_Tokyo_White"))
        
        //Dummy Data for Friends
        self.friends.append(Friend(profileImage: "Profile Img_10", fullName: "Landon Clark", username: "landon", followed: false))
        self.friends.append(Friend(profileImage: "Profile Img_9", fullName: "Felix Hamilton", username: "felix", followed: false))
        self.friends.append(Friend(profileImage: "Profile Img_8", fullName: "Josh Ranger", username: "josh_24", followed: false))
        self.friends.append(Friend(profileImage: "Profile Img_7", fullName: "Niki McDuffie", username: "Duffie", followed: false))
        self.friends.append(Friend(profileImage: "Profile Img_6", fullName: "Elisa Finch", username: "efinch", followed: false))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Set the corners, borders of views and button
        self.viewPlacesDot.layer.cornerRadius = 5
        self.viewFavoritesDot.layer.cornerRadius = 5
        self.viewFriendsDot.layer.cornerRadius = 5
        self.btnAddPlace.layer.borderColor = UIColor(hex: Constants.Color.btnFollow).cgColor
        self.btnAddPlace.layer.borderWidth = 1
        self.btnAddPlace.layer.cornerRadius = 2
        self.btnExplore.layer.borderColor = UIColor(hex: Constants.Color.btnFollow).cgColor
        self.btnExplore.layer.borderWidth = 1
        self.btnExplore.layer.cornerRadius = 2
    }
    
    private func handleMenuSelection(atIndex: Int) {
        //Places tapped
        self.lblPlaces.textColor = atIndex == 0 ? UIColor(hex: Constants.Color.primaryText) : UIColor(hex: Constants.Color.secondaryText)
        self.viewPlacesDot.backgroundColor = atIndex == 0 ? UIColor(hex: Constants.Color.selectedDot) : UIColor(hex: Constants.Color.unSelectedDot)
        
        //Favorites tapped
        self.lblFavorites.textColor = atIndex == 1 ? UIColor(hex: Constants.Color.primaryText) : UIColor(hex: Constants.Color.secondaryText)
        self.viewFavoritesDot.backgroundColor = atIndex == 1 ? UIColor(hex: Constants.Color.selectedDot) : UIColor(hex: Constants.Color.unSelectedDot)
        
        //Friends tapped
        self.lblFriends.textColor = atIndex == 2 ? UIColor(hex: Constants.Color.primaryText) : UIColor(hex: Constants.Color.secondaryText)
        self.viewFriendsDot.backgroundColor = atIndex == 2 ? UIColor(hex: Constants.Color.selectedDot) : UIColor(hex: Constants.Color.unSelectedDot)
    }
    
    //MARK: IBActions
    @IBAction func onBtnPlacesTappedAction(_ sender: UIButton) {
        self.handleMenuSelection(atIndex: 0)
        self.viewPlaces.isHidden = false
        self.viewFavorites.isHidden = true
        self.viewFriends.isHidden = true
        self.tblViewPlaces.reloadData()
    }
    
    @IBAction func onBtnFavoritesTappedAction(_ sender: UIButton) {
        self.handleMenuSelection(atIndex: 1)
        self.viewPlaces.isHidden = true
        self.viewFavorites.isHidden = false
        self.viewFriends.isHidden = true
    }
    
    @IBAction func onBtnFriendsTappedAction(_ sender: UIButton) {
        self.handleMenuSelection(atIndex: 2)
        self.viewPlaces.isHidden = true
        self.viewFavorites.isHidden = true
        self.viewFriends.isHidden = false
        self.tblViewFriends.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tblViewPlaces {
            return 130
        } else if tableView == self.tblViewFriends {
            return 45
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView == self.tblViewPlaces {
            return 12
        } else if tableView == self.tblViewFriends {
            return 24
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tblViewPlaces {
            return self.places.count
        } else if tableView == self.tblViewFriends {
            return self.friends.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblViewPlaces {
            return 1
        } else if tableView == self.tblViewFriends {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tblViewPlaces {
            let place = self.places[indexPath.section]
            let cell = self.tblViewPlaces.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
            cell.imgViewBanner.image = UIImage(named: place.bannerImage)
            cell.imgViewCountryIcon.image = UIImage(named: place.countryIcon)
            cell.lblSpotsCount.text = "\(place.noOfSpots) spots"
            cell.lblCountryName.text = place.country
            return cell
        } else {
            let friend = self.friends[indexPath.section]
            let cell = self.tblViewFriends.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
            cell.populateCell(withFriend: friend)
            return cell
        }
    }
}

class Place: NSObject {
    var country: String
    var noOfSpots: Int
    var bannerImage: String
    var countryIcon: String
    
    init(country: String, noOfSpots: Int, bannerImage: String, countryIcon: String) {
        self.country = country
        self.noOfSpots = noOfSpots
        self.bannerImage = bannerImage
        self.countryIcon = countryIcon
    }
}

class Friend: NSObject {
    var profileImage: String
    var fullName: String
    var username: String
    var followed: Bool
    
    init(profileImage: String, fullName: String, username: String, followed: Bool) {
        self.profileImage = profileImage
        self.fullName = fullName
        self.username = username
        self.followed = followed
    }
}
