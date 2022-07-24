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
        
        // 播放按钮的视图
        self.createPlayContentView()
        self.createPlayButtons()

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
    
    /// 创建容纳播放按钮的视图
    ///
    /// 视图的位置和大小
    ///  - 代码
    ///  - 易于调整
    ///  - 一步步迭代完成
    func createPlayContentView() {
        // 1. 生成tableView
        let aRect = CGRect(x: 0, y: 0, width: 500, height: 40)
        self.playContentView = UIView(frame: aRect)
//        self.playContentView.backgroundColor = .systemBlue
        
        // 2. 添加
        self.view.addSubview(self.playContentView)
        
        // 3. 大小及位置设置
        // 3.1 translatesAutoresizingMaskIntoConstraints
        self.playContentView.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.2 NSLayoutConstraint
        let safe = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.playContentView.heightAnchor.constraint(equalToConstant: 50),
            self.playContentView.topAnchor.constraint(equalTo: safe.topAnchor, constant: 20),
            self.playContentView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            self.playContentView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
        ])
    }
    
    /// 各个按钮
    var playButton: UIButton!
    var backwardButton: UIButton!
    var forwardButton: UIButton!

    /// 创建各个按钮
    ///
    /// 包括以下按钮：
    /// - 播放
    /// - 上一个
    /// - 下一个
    ///
    /// 视图的位置和大小
    ///  - 代码
    ///  - 易于调整
    ///  - 一步步迭代完成
    func createPlayButtons() {
        self.createPlayButton()
        self.createBackwardButton()
        self.createForwardButton()
    }
    
    /// 播放按钮
    ///
    /// 图像：play.circle.fill
    func createPlayButton() {
        // 1. 生成 播放按钮
        let aRect = CGRect(x: 0, y: 0, width: 500, height: 40)
        self.playButton = UIButton(frame: aRect)
        
        // 1.1. 配置按钮image的外观，使用Symbol Images
        // Create a configuration object that’s initialized with two palette colors.
        var config = UIImage.SymbolConfiguration(paletteColors: [.systemBackground, .systemMint])

        // Apply a configuration that scales to the system font point size of 42.
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 48)))
        config.applying(UIImage.SymbolConfiguration(scale: .large))

        let image = UIImage(systemName: "play.circle.fill", withConfiguration: config)
        // Create a symbol image with a tint using UIKit.
//        image = image?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        
        self.playButton.setImage(image, for: .normal)
        
        
        // 2. 添加
        self.playContentView.addSubview(self.playButton)
        
        // 3. 大小及位置设置
        // 3.1 translatesAutoresizingMaskIntoConstraints
        self.playButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.2 NSLayoutConstraint
        let safe = self.playContentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.playButton.heightAnchor.constraint(equalToConstant: 50),
            self.playButton.widthAnchor.constraint(equalToConstant: 100),
            self.playButton.centerXAnchor.constraint(equalTo: safe.centerXAnchor),
            self.playButton.centerYAnchor.constraint(equalTo: safe.centerYAnchor),
        ])
    }
    
    /// 上一个按钮
    ///
    /// 图像：backward.end.fill
    func createBackwardButton() {
        // 1. 生成 播放按钮
        let aRect = CGRect(x: 0, y: 0, width: 500, height: 40)
        self.backwardButton = UIButton(frame: aRect)
        
        // 1.1. 配置按钮image的外观，使用Symbol Images
        // Create a configuration object that’s initialized with two palette colors.
        var config = UIImage.SymbolConfiguration(paletteColors: [.label, .tertiaryLabel])

        // Apply a configuration that scales to the system font point size of 42.
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 28)))
        config.applying(UIImage.SymbolConfiguration(scale: .large))

        let image = UIImage(systemName: "backward.end.fill", withConfiguration: config)
        // Create a symbol image with a tint using UIKit.
//        image = image?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        
        self.backwardButton.setImage(image, for: .normal)
        
        
        // 2. 添加
        self.playContentView.addSubview(self.backwardButton)
        
        // 3. 大小及位置设置
        // 3.1 translatesAutoresizingMaskIntoConstraints
        self.backwardButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.2 NSLayoutConstraint
        let safe = self.playButton.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.backwardButton.heightAnchor.constraint(equalToConstant: 50),
            self.backwardButton.widthAnchor.constraint(equalToConstant: 100),
            self.backwardButton.trailingAnchor.constraint(equalTo: safe.leadingAnchor, constant: -20),
            self.backwardButton.centerYAnchor.constraint(equalTo: safe.centerYAnchor),
        ])
    }
    
    /// 下一个按钮
    ///
    /// 图像：forward.end.fill
    func createForwardButton() {
        // 1. 生成 播放按钮
        let aRect = CGRect(x: 0, y: 0, width: 500, height: 40)
        self.forwardButton = UIButton(frame: aRect)
        
        // 1.1. 配置按钮image的外观，使用Symbol Images
        // Create a configuration object that’s initialized with two palette colors.
        var config = UIImage.SymbolConfiguration(paletteColors: [.label, .tertiaryLabel])

        // Apply a configuration that scales to the system font point size of 42.
        config = config.applying(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 28)))
        config.applying(UIImage.SymbolConfiguration(scale: .large))

        let image = UIImage(systemName: "forward.end.fill", withConfiguration: config)
        // Create a symbol image with a tint using UIKit.
//        image = image?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        
        self.forwardButton.setImage(image, for: .normal)
        
        
        // 2. 添加
        self.playContentView.addSubview(self.forwardButton)
        
        // 3. 大小及位置设置
        // 3.1 translatesAutoresizingMaskIntoConstraints
        self.forwardButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 3.2 NSLayoutConstraint
        let safe = self.playButton.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.forwardButton.heightAnchor.constraint(equalToConstant: 50),
            self.forwardButton.widthAnchor.constraint(equalToConstant: 100),
            self.forwardButton.leadingAnchor.constraint(equalTo: safe.trailingAnchor, constant: 20),
            self.forwardButton.centerYAnchor.constraint(equalTo: safe.centerYAnchor),
        ])
    }
}

