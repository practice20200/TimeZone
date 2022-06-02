//
//  DetailedCountryModel.swift
//  Timezone
//
//  Created by Apple New on 2022-06-01.
//

import Foundation
import UIKit
struct CountriesData:Codable{
    let data: [Countries]
}

struct Countries: Codable{
    let name: String
    let code: String
    let capital: String
    let region: String
//    var currency: currency
//    let languages: languages
//    let flag: String
}

//struct Regions: Codable{
//    let name: String
//    let code: String
//}
  

struct currency: Codable{
//    let reginons:Regions
    let name: String
    let code: String
    let symbol: String
}

struct languages: Codable{
//    let regions: Regions
    let name: String
    let code: String
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
