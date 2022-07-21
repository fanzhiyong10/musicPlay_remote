//
//  ViewController.swift
//  musicPlay
//
//  Created by 范志勇 on 2022/7/21.
//

import UIKit

class ViewController: UIViewController {

    var secondLabel: UILabel!
    var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.createLabel()
    }

    func createLabel() {
        var aRect = CGRect(x: 10, y: 60, width: 200, height: 30)
        testLabel = UILabel(frame: aRect)
        testLabel.text = "测试label"
        testLabel.textColor = .red
        self.view.addSubview(self.testLabel)
        
        
        aRect.origin.y += 50
        secondLabel = UILabel(frame: aRect)
        secondLabel.text = "测试: 第二个 label"
        secondLabel.textColor = .red
        self.view.addSubview(self.secondLabel)
    }

}

