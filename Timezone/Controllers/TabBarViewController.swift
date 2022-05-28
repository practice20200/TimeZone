//
//  TabBarViewController.swift
//  Timezone
//
//  Created by Apple New on 2022-05-27.
//

import Foundation
import UIKit
class TabBarViewController: UITabBarController{
    
    
    
    override func viewDidLoad() {
        
        let countryVC = CountriesViewController()
        countryVC.tabBarItem = UITabBarItem(title: "Country", image: UIImage(systemName: "globe.americas.fill"), tag: 0)
        
       
        let homeVC = ViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Timezone", image: UIImage(systemName: "clock"), tag: 1)
//        homeVC.tabBarItem.badgeColor = UIColor.systemGray3
       
        
        let friendVC = FriendViewController()
        friendVC.tabBarItem = UITabBarItem(title: "Friend", image: UIImage(systemName: "person.3"), tag: 2)
//        friendVC.tabBarItem.badgeColor = UIColor.systemGray3

        tabBar.backgroundColor = UIColor.systemBackground
        tabBar.tintColor = UIColor.systemGray

        viewControllers = [countryVC, homeVC, friendVC]
       
    }
}



