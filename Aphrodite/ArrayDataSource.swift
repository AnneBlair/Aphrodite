//
//  ArrayDataSource.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

typealias cellConfigureClasure = (_ cell: Any,_ item: Any,_ indexPath: IndexPath)->Void

open class ArrayDataSource: NSObject,UITableViewDataSource {
    
    var items: [[Any]] = []
    var cellIdentifier: String?
    var configureCellClasure: cellConfigureClasure?
    
    init(anItems: [[Any]],identifier: String,clasure: cellConfigureClasure?) {
        items = anItems
        cellIdentifier = identifier
        if let clasure = clasure {
            configureCellClasure = clasure
        }
    }
    
    func itemAtIndexPath(indexpath: Int) -> [Any] {
        return items[indexpath]
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (itemAtIndexPath(indexpath: section) as AnyObject).count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier!, for: indexPath)
        let item = itemAtIndexPath(indexpath: indexPath.section)[indexPath.row]
        if let configureCellClasure = configureCellClasure {
            configureCellClasure(cell,item,indexPath)
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
