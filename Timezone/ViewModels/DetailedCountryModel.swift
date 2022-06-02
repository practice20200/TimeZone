//
//  DetailedCountryModel.swift
//  Timezone
//
//  Created by Apple New on 2022-06-01.
//

import Foundation
import UIKit
struct CountriesData:Decodable{
    var countriesData: [Countries]
}

//struct Countries: Codable{
//    var name: String
//    var code: String
//    var capital: String
//    var region: String
//    var currency: currency
//    var language: language
//    var flag: String
//}
//
//
//struct currency: Codable{
////    let reginons:Regions
//    var code: String
//    var name: String
//    var symbol: String
//}
//
//struct language: Codable{
////    let regions: Regions
//    var code: String
//    var name: String
//
//}

struct Countries: Codable {
    var name: String
    var code: String
    var capital: String
    var region: String
    var currency: currency
    var language : language
    var flag: String
}

struct currency: Codable{
    var code: String
    var name: String
    var symbol: String
}

struct language: Codable{
    var code: String
    var name: String
}

//
//
//    "name": "Afghanistan",
//    "code": "AF",
//    "capital": "Kabul",
//    "region": "AS",
//    "currency": {
//        "code": "AFN",
//        "name": "Afghan afghani",
//        "symbol": "؋"
//    },
//    "language": {
//        "code": "ps",
//        "name": "Pashto",
//    },
//    "flag": "https://restcountries.eu/data/afg.svg",
//

//
//"countryDetailedData":[
//"Regions": [
//    {
//        {"name": "Africa", "code": "AF" },
//       { "name": "North America", "code": "NA" },
//       { "name": "Oceania", "code": "OC" },
//       { "name": "Antarctica", "code": "AN" },
//       { "name": "Asia", "code": "AS" },
//       { "name": "Europe", "code": "EU" },
//       { "name": "South America", "code": "SA" },
//}
//        
//    ];
