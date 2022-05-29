//
//  Profile.swift
//  Timezone
//
//  Created by Apple New on 2022-05-23.
//

import Foundation
import UIKit
import Realm
import RealmSwift
//struct Profile{
//    var name: String
//    var Location: String
//    var Timezone: String
//    var PreferrableCountryTime: String
//}



class Profile: Object{
    @objc dynamic var profileImage: String = "person.crop.circle"
    @objc dynamic var name: String = "Name"
    @objc dynamic var Location: String = "Canada"
    @objc dynamic var Timezone: String = "Calfornia, US"
    @objc dynamic var PreferrableCountryTime: String = "10:00-18:00"
}
