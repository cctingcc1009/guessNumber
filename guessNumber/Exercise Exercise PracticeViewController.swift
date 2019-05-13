//
//  Exercise Exercise PracticeViewController.swift
//  guessNumber
//
//  Created by Simon on 2018/4/8.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
import GameplayKit

class Exercise_Exercise_PracticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        topic()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //建立一個四個直的空陣列，存亂數
    var randomArray:[String] = ["","","",""]
    //建立一個亂數題目
    func topic(){
        let random = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        //判斷i到陣列的數,並取一個直個放入空字串中
        for i in 0...randomArray.count - 1{
            randomArray[i] = "\(random.nextInt())"
        }
        print("\(randomArray)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
