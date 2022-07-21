//
//  ViewController.swift
//  musicPlay
//
//  Created by 范志勇 on 2022/7/21.
//

import UIKit

class ViewController: UIViewController {

    var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.createLabel()
    }

    func createLabel() {
        var aRect = CGRect(x: 10, y: 10, width: 200, height: 30)
        testLabel = UILabel(frame: aRect)
        testLabel.text = "测试label"
        self.view.addSubview(self.testLabel)
    }

}

