//
//  ItemCell.swift
//  StockTest
//
//  Created by Алексей Папин on 27.08.2018.
//  Copyright © 2018 Алексей Папин. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    static let identifier = "\(ItemCell.self)"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    public func configure(with item: Item) {        
        self.nameLabel.text = item.name
        self.volumeLabel.text = "\(item.price)"
        self.amountLabel.text = item.volumeString
    }
}
