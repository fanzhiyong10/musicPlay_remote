//
//  ViewControllerExtensionTable.swift
//  musicPlay
//
//  Created by 范志勇 on 2022/7/24.
//

import UIKit

/// 表单
///
/// 基本设定
///  - 行数
///  - 行高
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// tableView生成及设置
    ///
    /// 设置
    ///  - 注册
    ///  - 数据源
    ///  - 代理
    ///  - 大小及位置
    func createTableView() {
        // 1. 生成tableView
        self.tableView = UITableView()
        self.view.addSubview(self.tableView)
        
        // 2. 设置tableView
        // 2.1 注册
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellID)
        // 2.2 数据源
        self.tableView.dataSource = self
        // 2.3 代理
        self.tableView.delegate = self

        // 3. 大小及位置设置
        // 3.1 translatesAutoresizingMaskIntoConstraints
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.2 NSLayoutConstraint
        let safe = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.playContentView.bottomAnchor, constant: 20),
            self.tableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
        ])
//        NSLayoutConstraint.activate([
//            self.tableView.topAnchor.constraint(equalTo: safe.topAnchor),
//            self.tableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
//            self.tableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
//            self.tableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
//        ])
    }

    /// 行数量
    ///
    /// 仅有 1 个 section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.allSounds != nil else {
            return 0
        }
        return self.allSounds!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//
        cell.textLabel!.text = self.allSounds![indexPath.row].name
        cell.textLabel!.textColor = .darkGray
        
        cell.separatorInset = UIEdgeInsets.zero
        
//        cell.textLabel!.text = self.allProducts[indexPath.row].localizedTitle
        
        cell.accessoryType = .none
        cell.backgroundColor = UIColor.white
        
        //背景颜色：相邻的两行颜色不同（奇偶不同）
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = ConfigureOfColor.evenRowBackgroundColorV2
        }
        else {
            cell.contentView.backgroundColor = ConfigureOfColor.oddRowBackgroundColorV2
        }
        
        // 选中的颜色设置
        if self.selected == indexPath.row {
            cell.accessoryType = .checkmark
            
            // 颜色设置
            cell.backgroundColor = UIColor.yellow // accessory
            cell.contentView.backgroundColor = UIColor.yellow // contentView
        }
        
        return cell
    }
    
    /// 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }


}
