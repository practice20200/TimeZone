//
//  ResultItem.swift
//  Timezone
//
//  Created by Apple New on 2022-05-27.
//

import Foundation
struct ResultItem: Codable {
    let value: String
    let abbr: String
    let offset: Float
    let isdst: Bool
    let text: String
    let utc: [String]
}
