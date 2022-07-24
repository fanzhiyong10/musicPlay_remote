//
//  ViewController.swift
//  musicPlay
//
//  Created by 范志勇 on 2022/7/21.
//

import UIKit

/// 视图控制器
///
/// 屏幕分为三个部分
/// - 频谱：播放乐曲的频谱分析
/// - 按钮：上一首、播放、下一首
/// - 表单：乐曲列表
/// - 滚动乐曲集
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 数据加载
        self.loadData()
        
        self.createTableView()
    }


    /// 与tableView相关的参数
    let cellID = "cellID" // tableViewCell相关
    var tableView: UITableView!
    
    // 选中的索引
    var selected = 0
    
    // 数据项：声音
    var allSounds: [Sound]?
    
    /// 加载数据
    ///
    /// 分步骤实施
    /// - 搭建框架时，使用测试数据
    func loadData() {
        self.allSounds = Sound.createAllSounds()
    }
    
    /// 播放按钮的视图
    var playContentView: UIView!
    var playButton: UIButton!
    func createPlayContentView() {
        
    }
}

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
            self.tableView.topAnchor.constraint(equalTo: safe.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
        ])
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
