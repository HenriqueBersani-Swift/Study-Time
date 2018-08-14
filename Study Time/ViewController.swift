//
//  ViewController.swift
//  Study Time
//
//  Created by Henrique Bersani on 8/10/18.
//  Copyright © 2018 Henrique Bersani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var goal = ""
    
    // Goal Views
    @IBOutlet weak var goalOneView: UIView!
    @IBOutlet weak var goalTwoView: UIView!
    @IBOutlet weak var goalThreeView: UIView!
    @IBOutlet weak var goalFourView: UIView!
    @IBOutlet weak var goalFiveView: UIView!
    
    //Goal Labels
  
    @IBOutlet weak var goalOneLabel: UILabel!
    @IBOutlet weak var goalTwoLabel: UILabel!
    @IBOutlet weak var goalThreeLabel: UILabel!
    @IBOutlet weak var goalFourLabel: UILabel!
    @IBOutlet weak var goalFiveLabel: UILabel!
    
    // Timer Label
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // Run Timer
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)" //This will update the label.
        if seconds == 0 {
            timer.invalidate()
            
        }
    }
    
    // Add Goals
    @IBAction func addGoal(_ sender: Any) {
        goal = goalName.text!
        
        if goalOneView.isHidden {
            goalOneView.isHidden = false
            goalOneLabel.text = "\(goal)"
            goalName.text = ""
        
        } else if goalTwoView.isHidden {
            goalTwoView.isHidden = false
            goalTwoLabel.text = "\(goal)"
            goalName.text = ""
        } else if goalThreeView.isHidden {
            goalThreeView.isHidden = false
            goalThreeLabel.text = "\(goal)"
            goalName.text = ""
        } else if goalFourView.isHidden {
            goalFourView.isHidden = false
            goalFourLabel.text = "\(goal)"
            goalName.text = ""
        } else if goalFiveView.isHidden {
            goalFiveView.isHidden = false
            goalFiveLabel.text = "\(goal)"
            goalName.text = ""
        }
        //seconds = Int(countDownDuration)
        runTimer()
       
        
    }
    
    var countDownDuration: TimeInterval = 0.0
    

    
    @IBOutlet weak var countDownTimer: UIDatePicker!
 
    
    @IBOutlet weak var goalName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}



