//
//  NameViewController.swift
//  SecondKadaiApp
//
//  Created by kataoka-tatsunari on 2018/10/30.
//  Copyright © 2018年 tatsunari-k. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    //UIlabelのOutlet接続（出口接続）もの
    @IBOutlet weak var HelloNameLabel: UILabel!
    var InputName:String = "" //メインViewから入力した名前を代入する変数
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HelloNameLabel.text = "こんにちわ\(InputName)さん"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
