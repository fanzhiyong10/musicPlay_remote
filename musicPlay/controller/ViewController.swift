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

