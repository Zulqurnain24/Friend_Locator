//
//  FriendBrowseView.swift
//
//  Created by Mohammad Zulqurnain on 09/08/18.
//  Copyright © 2018 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class FriendBrowseView: UIView {
  internal let table: UITableView = {
    let table = UITableView()
    table.frame = CGRect(x: 0, y: 0, width: 480, height: 690)
    table.enableAutoLayout()
    return table
  } ()

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(table)
    table.backgroundColor = Colors.lightGray
    table.separatorColor = Colors.lightGray
    table.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
    table.topAnchor.constraint(equalTo: (self.topAnchor)).activate()
    table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    table.bottomAnchor.constraint(equalTo: (self.bottomAnchor)).activate()
    table.showsHorizontalScrollIndicator = false
    table.showsVerticalScrollIndicator = false
  }

  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    table.dataSource = dataSource
    table.delegate = delegate
    table.register(FriendCell.self, forCellReuseIdentifier: "\(FriendCell.self)")
  }
}
