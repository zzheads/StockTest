//
//  ViewController.swift
//  StockTest
//
//  Created by Алексей Папин on 27.08.2018.
//  Copyright © 2018 Алексей Папин. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var items = [Item]()
    weak var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ItemCell.nib, forCellReuseIdentifier: ItemCell.identifier)
        self.tableView.rowHeight = 50
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(self.refresh))
        self.timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(self.refresh), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @objc func refresh() {
        self.navigationItem.rightBarButtonItem?.isEnabled = false

        Stock.fetch()
            .done { stock in
                self.items = stock.stock
                self.tableView.reloadData()
            }
            .catch { dump($0) }
            .finally { self.navigationItem.rightBarButtonItem?.isEnabled = true }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.configure(with: self.items[indexPath.row])
        return cell
    }
}

