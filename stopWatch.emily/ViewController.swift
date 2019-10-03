//
//  ViewController.swift
//  stopWatch.emily
//
//  Created by 野崎絵未里 on 2019/10/03.
//  Copyright © 2019 emily.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number:Float = 0.00
    var count: Int = 1
    
    var timer: Timer = Timer()
    
    @IBOutlet weak var label: UILabel!
    
    var stop:Bool = true
    
    @objc func up() {
        number = number + 0.01
        label.text = String(format: "%.3f",number)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        count = count + 1
        if count % 2 == 1 {
            stop = false
        } else {
            stop = true
        }
        if stop == false {
            timer.invalidate()
        } else {
            //timer.restart
            //継続させる
            timer = Timer.scheduledTimer(timeInterval: 0.01,target: self,selector:  #selector(self.up),userInfo: nil,repeats: true)
        }
        print(number)
    }
    
    @IBAction func restart(_ sender: Any) {
        number = 0.0
        count = 1
        stop = true
        label.text = "えりりん"
        
    }
    

}

