//
//  ViewController.swift
//  SecondKadaiApp
//
//  Created by kataoka-tatsunari on 2018/10/30.
//  Copyright © 2018年 tatsunari-k. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //ボタンを本スクリプトに紐付け
    @IBOutlet weak var namebutton: UIButton!
    @IBOutlet weak var mytextfield: UITextField!
    
    //NameViewから戻ってくるためのセグエメソッド
    @IBAction func nameviewback(NameViewback: UIStoryboardSegue) {
    }
    
    //UItextlabel上で入力された内容を入れる変数
    var NameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)　インスペ指定も可
        mytextfield.placeholder = "ここに名前を入力してください"
        mytextfield.textColor = UIColor.blue
        //テキストフィールドの境界線のタイプ　インスペ指定も可
        mytextfield.borderStyle = UITextBorderStyle.roundedRect
        //入力文字のクリアボタンの表示
        mytextfield.clearButtonMode = UITextFieldViewMode.whileEditing //編集時表示
        //文字入力時のキーボードタイプ　インスペ指定も可
        mytextfield.keyboardType = UIKeyboardType.namePhonePad
        //キーボード内のリターンキーの設定　インスペ指定も可
        mytextfield.returnKeyType = UIReturnKeyType.done //完了ボタン
        //Delegateを自身に設定
        mytextfield.delegate = self
    }
    
    //UItextlabel内の入力内容をNameTextへ代入し、InputName内にNameTextを代入する
    //入力内容の取得
    //ボタンを押すことで、入力内容の確定と代入
    @IBAction func NameSend(_ sender: Any) {
       NameText = mytextfield.text!
    }
    
    ////遷移先のNameViewからプロパティを取得し、その変数内に、UITextFieldで入力した内容を渡す////
    //画面遷移の際に呼ばれるprepare(for:sender:)メソッドを使用する
    //ここでは、NameView内の変数"◯◯"にtextfieldに入力した内容を代入する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //　segueから遷移先のNameViewControllerを取得する
        let nameViewController:NameViewController = segue.destination as! NameViewController
        // 遷移先のNameViewControllerで宣言しているlabelに文字列を渡す
        nameViewController.InputName = "\(NameText)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //UItextFieldを入力中に、画面の外をタッチした際、キーボードを閉じる処理
    //参照https://qiita.com/jumpyoshim/items/4b8b5f2297910d7f3d1b
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //画面の外をタッチした際に、入力済みのテキストをラベルへと飛ばす処理
        //outputText.text = inputText.text
        //キーボードを閉じる処理
        self.view.endEditing(true)
    }
}

