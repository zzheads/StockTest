//
//  Item.swift
//  StockTest
//
//  Created by Алексей Папин on 27.08.2018.
//  Copyright © 2018 Алексей Папин. All rights reserved.
//

import Foundation

//{
//    "name": "2GO Group",
//    "price": {
//        "currency": "PHP",
//        "amount": 13.78
//    },
//    "percent_change": 0,
//    "volume": 12000,
//    "symbol": "2GO"
//}

struct Item: Codable {
    var name            : String
    var price           : Price
    var percent_change  : Double
    var volume          : Int
    var symbol          : String
}

extension Item {
    var volumeString: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        guard let string = formatter.string(from: self.volume as NSNumber) else {
            return "\(self.volume)"
        }
        return string
    }
}
