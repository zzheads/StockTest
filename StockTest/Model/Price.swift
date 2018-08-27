//
//  Price.swift
//  StockTest
//
//  Created by Алексей Папин on 27.08.2018.
//  Copyright © 2018 Алексей Папин. All rights reserved.
//

import Foundation

//    "price": {
//        "currency": "PHP",
//        "amount": 13.78
//    },

struct Price: Codable {
    var currency    : String
    var amount      : Double
}

extension Price: CustomStringConvertible {
    var description: String {
        return String(format: "%.2f \(self.currency)", self.amount)
    }
}
