//
//  ViewController.swift
//  guessNumber
//
//  Created by Simon on 2018/4/6.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    //答案標籤
    @IBOutlet weak var answerLabel: UILabel!
    //使用者輸入
    @IBOutlet weak var enterTextField: UITextField!
    //提示
    @IBOutlet weak var promptTextView: UITextView!
    //紀錄
    @IBOutlet weak var recordsTextView: UITextView!
    //次數
    @IBOutlet weak var frequencyLabel: UILabel!
    var frequency = 0
    //題目
    var randomArray = ["","","",""]
    //紀錄
    var record:String = ""
    var record1:String = ""
    //正確
    func correct(){
        answerLabel.isHidden = false
        answerLabel.text = "\(randomArray[0])" + "\(randomArray[1])" + "\(randomArray[2])" + "\(randomArray[3])"
    }
    //建立題目
    func topic () {
        let number = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        for i in 0...randomArray.count - 1{
            randomArray[i] = "\(number.nextInt())"
        }
        print("\(randomArray)")
    }
    //建立警告控制
    func caveat (title:String ,message:String? ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    //觸發tap時的方法
    var tap = 0
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
        if tap == 0{
            self.navigationController?.isNavigationBarHidden = false
            tap = 1
        }else if tap == 1 {
            self.navigationController?.isNavigationBarHidden = true
            tap = 0
        }
    }
    
    @IBAction func goButton(_ sender: Any) {
        if let enter = enterTextField.text {
            if enter.count == 4 {
                var a = 0
                var b = 0
                var i = 0
                frequency += 1
                frequencyLabel.text = "\(frequency)"
                //檢查答案
                for ii in enter {
                    let number = String(ii)
                    //檢查陣列的直是不是符合
                    if randomArray[i] == number{
                        a += 1
                    }
                    //檢查陣列的值事不是包含使用者輸入的值
                    else if randomArray.contains(number){
                      b += 1
                     }
                    i += 1
                }
                //是否答對
                if a == 4 {
                    correct()
                    caveat(title: "成功", message: "Good")
                }else{
                //錯的話給提示
                    recordAnswer(answer: enter, a: a, b: b)
                }
            }else{
                caveat(title: "錯誤", message: "請輸入四個不一樣的數字")
                enterTextField.text = ""
            }
        }
        //收起鍵盤
        view.endEditing(true)
    }
    //重新開始
    @IBAction func againButton(_ sender: Any) {
        topic()
        frequency = 0
        frequencyLabel.text = "\(frequency)"
        promptTextView.text = ""
        recordsTextView.text = ""
        enterTextField.text = ""
        answerLabel.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        topic()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //紀錄答案
    func recordAnswer(answer: String, a: Int, b: Int) {
        record = "\(a)A\(b)B \n" + record
        record1 = "\(answer)" + record1
        promptTextView.text = record
        recordsTextView.text = record1
        enterTextField.text = ""
    }
}

