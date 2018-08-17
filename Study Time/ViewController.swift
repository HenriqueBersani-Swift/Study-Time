//
//  ViewController.swift
//  Study Time
//
//  Created by Henrique Bersani on 8/10/18.
//  Copyright © 2018 Henrique Bersani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    var goal = ""
    
    
    
    // Goal Is On\OFF
    var oneIsOn = false
    var twoIsOn = false
    var threeIsOn = false
    var fourIsOn = false
    var fiveIsOn = false
    
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
    
    //Goal Time Labels
    
    @IBOutlet weak var goalOneTimeLabel: UILabel!
    @IBOutlet weak var goalTwoTimeLabel: UILabel!
    @IBOutlet weak var goalThreeTimeLabel: UILabel!
    @IBOutlet weak var goalFourTimeLabel: UILabel!
    @IBOutlet weak var goalFiveTimeLabel: UILabel!

    @IBAction func testing(_ sender: Any) {
        print("\(countDownTimer.countDownDuration)")
    }
    
    //Exit Timer
    
    @IBAction func exitTimer(_ sender: Any) {
        //let allGoals = [oneIsOn,twoIsOn,threeIsOn,fourIsOn,fiveIsOn]
        
        if oneIsOn == true {
            goalOneTime = Double(seconds)
            goalOneTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            oneIsOn = false
        } else if twoIsOn == true {
                goalTwoTime = Double(seconds)
                goalTwoTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
                twoIsOn = false
        }else if threeIsOn == true {
            goalThreeTime = Double(seconds)
            goalThreeTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            threeIsOn = false
        }else if fourIsOn == true {
            goalFourTime = Double(seconds)
            goalFourTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            fourIsOn = false
        }else if fiveIsOn == true {
            goalFiveTime = Double(seconds)
            goalFiveTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            fiveIsOn = false
        }
        print("\(goalOneTime)")
        ViewTimerRunning.isHidden = true
        timer.invalidate()
    }
    
    
    
    // Start Study Timer
    @IBAction func startOne(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalOneLabel.text
        seconds = Int(goalOneTime)
        countDownTimer.countDownDuration = goalOneTime
        timerLabel.text = timeString(time: TimeInterval(goalOneTime))
        runTimer()
        oneIsOn = true
    }
    @IBAction func startTwo(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalTwoLabel.text
        seconds = Int(goalTwoTime)
        countDownTimer.countDownDuration = goalTwoTime
        timerLabel.text = timeString(time: TimeInterval(goalTwoTime))
        runTimer()
        twoIsOn = true
    }
    @IBAction func startThree(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalThreeLabel.text
        seconds = Int(goalThreeTime)
        countDownTimer.countDownDuration = goalThreeTime
        timerLabel.text = timeString(time: TimeInterval(goalThreeTime))
        runTimer()
        threeIsOn = true
    }
    @IBAction func startFour(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalFourLabel.text
        seconds = Int(goalFourTime)
        countDownTimer.countDownDuration = goalFourTime
        timerLabel.text = timeString(time: TimeInterval(goalFourTime))
        runTimer()
        fourIsOn = true
    }
    @IBAction func startFive(_ sender: Any) {
        ViewTimerRunning.isHidden = false
        labelOfGoalRunning.text = goalFiveLabel.text
        seconds = Int(goalFiveTime)
        countDownTimer.countDownDuration = goalFiveTime
        timerLabel.text = timeString(time: TimeInterval(goalFiveTime))
        runTimer()
        fiveIsOn = true
    }

    // View of Timer Running
    
    @IBOutlet weak var ViewTimerRunning: UIView!
    
    @IBOutlet weak var labelOfGoalRunning: UILabel!
    
    // Timer Label
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // Run Timer
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = timeString(time: TimeInterval(seconds)) //This will update the label.
        if seconds == 0 {
            timer.invalidate()
            
        }
    }
    
    // Timer Value
    
    var goalOneTime: Double = 00
    var goalTwoTime: Double = 00
    var goalThreeTime: Double = 00
    var goalFourTime: Double = 00
    var goalFiveTime: Double = 00
    var goalSixTime: Double = 00
    var goalSevenTime: Double = 00
    var goalEightTime: Double = 00
    var goalNineTime: Double = 00
    var goalTenTime: Double = 00

    //Formatting Hours, Minutes, Seconds
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String("\(hours) : \(minutes) : \(seconds)")
    }
    
    
    // Add Goals
    @IBAction func addGoal(_ sender: Any) {
        goal = goalName.text!
        //runTimer()
        seconds = Int(countDownTimer.countDownDuration)
        
        if goalOneView.isHidden {
            goalOneView.isHidden = false
            goalOneLabel.text = "\(goal)"
            goalOneTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalOneTime = countDownTimer.countDownDuration
        
        } else if goalTwoView.isHidden {
            goalTwoView.isHidden = false
            goalTwoLabel.text = "\(goal)"
            goalTwoTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalTwoTime = countDownTimer.countDownDuration
            
        } else if goalThreeView.isHidden {
            goalThreeView.isHidden = false
            goalThreeLabel.text = "\(goal)"
            goalThreeTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalThreeTime = countDownTimer.countDownDuration
            
        } else if goalFourView.isHidden {
            goalFourView.isHidden = false
            goalFourLabel.text = "\(goal)"
            goalFourTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalFourTime = countDownTimer.countDownDuration
            
        } else if goalFiveView.isHidden {
            goalFiveView.isHidden = false
            goalFiveLabel.text = "\(goal)"
            goalFiveTimeLabel.text = "\(timeString(time: TimeInterval(seconds)))"
            goalName.text = ""
            goalFiveTime = countDownTimer.countDownDuration
        }
    
       print("\(countDownTimer.countDownDuration)")
       print("\(goalOneTime)")
       
        
    }
    
  var countDownDuration: TimeInterval?
    
    //var countDownDuration: TimeInterval { get set }

    
    @IBOutlet weak var countDownTimer: UIDatePicker!
 
   // TextField
    @IBOutlet weak var goalName: UITextField!
    let limitLength = 27
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalName.delegate = self
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = goalName.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= limitLength
    }

}



