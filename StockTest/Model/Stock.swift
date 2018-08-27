//
//  Stock.swift
//  StockTest
//
//  Created by Алексей Папин on 27.08.2018.
//  Copyright © 2018 Алексей Папин. All rights reserved.
//

import Alamofire
import PromiseKit

struct Stock: Codable {
    static let url = URL(string: "https://phisix-api3.appspot.com/stocks.json")!
    var stock: [Item]
    
    static func fetch() -> Promise<Stock> {
        return Promise<Stock>() { resolver in
            Alamofire.request(url).responseJSON { response in
                switch response.result {
                case .success(let value)    :
                    guard let json = value as? JSON else {
                        resolver.reject(NSError(domain: "StockTest Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Parsing response error: \(value) is not a JSON"]))
                        return
                    }
                    guard let stock = Stock(from: json) else {
                        resolver.reject(NSError(domain: "StockTest Error", code: 400, userInfo: [NSLocalizedDescriptionKey: "Serialization error: can't get Stock object from JSON: \(json)"]))
                        return
                    }
                    resolver.fulfill(stock)
                    
                case .failure(let error)    : resolver.reject(error)
                }
            }
        }
    }
}
