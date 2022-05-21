//
//  ConvenientTool.swift
//  Timezone
//
//  Created by Apple New on 2022-05-20.
//

import Foundation
class ConvenientTool{
    static func formatterDateDetailed(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yy HH:mm"
        return formatter.string(from: date)
    }
}
