//
//  ViewController.swift
//  stopWatch.emily
//
//  Created by 野崎絵未里 on 2019/10/03.
//  Copyright © 2019 emily.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var number:Float = 0.00
    var count: Int = 1
    var timer: Timer = Timer()
    var stop:Bool = true
    var cellLabel: UILabel?
    var timeArray: Array = [Double]()
    
    @IBOutlet weak var label: UILabel!
    //@IBOutlet weak var cell: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @objc func up() {
        number = number + 0.01
        label.text = String(format: "%.3f",number)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
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
            print(number)
            timeArray.append(Double(number))
            print(timeArray)
        } else {
            //継続させる
            timer = Timer.scheduledTimer(timeInterval: 0.01,target: self,selector:  #selector(self.up),userInfo: nil,repeats: true)
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        number = 0.0
        count = 1
        stop = true
        label.text = "new"
        timeArray.removeAll()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cellの内容を決める（超重要）
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if stop == false {
        cell.textLabel!.text = String(timeArray[indexPath.row])
        }
        tableView.performBatchUpdates({
            self.tableView.reloadData()
        })
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

