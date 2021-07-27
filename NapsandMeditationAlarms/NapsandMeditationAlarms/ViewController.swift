//
//  ViewController.swift
//  NapsandMeditationAlarms
//
//  Created by 신지훈 on 2021/07/26.
//
///http://yoonbumtae.com/?p=3439 타이머
import UIKit

class ViewController: UIViewController {
    
    //시간 추가 생성
    
    
    @IBOutlet weak var plus10MinBtn: UIButton!
    
    @IBOutlet weak var plus20Minbtn: UIButton!
    
    @IBOutlet weak var plus30Minbtn: UIButton!
    
    @IBOutlet weak var plus60Minbtn: UIButton!
    
    @IBOutlet weak var plus120Minbtn: UIButton!
    
    
    @IBOutlet weak var add5MinBtn: UIButton!
    
    
//타이머 생성
    
    @IBOutlet weak var TimarLabel: UILabel!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var StartStopBtn: UIButton!
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
    }
   
    
    
    @IBAction func resetTapped(_ sender: Any) {
        self.count = 0
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 0, seconds: 0)
        StartStopBtn.setTitle("Start", for: .normal)
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
    }
    
    
    @IBAction func plus10MinTapped(_ sender: Any) {
        self.count = 600
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 10, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @IBAction func plus20MinTapped(_ sender: Any) {
        self.count = 1200
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 20, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    
    @IBAction func plus30MinTapped(_ sender: Any) {
        self.count = 1800
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 30, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func plus60MinTapped(_ sender: Any) {
        self.count = 3600
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 1, minute: 0, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func plus120MinTapped(_ sender: Any) {
        self.count = 7200
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 2, minute: 0, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    
    @IBAction func add5MInTapped(_ sender: Any) {
        self.count += 300
    }
    
    
    
    
    
    
    @IBAction func startStopTapped(_ sender: Any) {
    
    if(timerCounting) {
        timerCounting = false
        timer.invalidate()
        StartStopBtn.setTitle("Start", for: .normal)
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
    
    } else {
        timerCounting = true
        StartStopBtn.setTitle("Stop", for: .normal)
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func timerCounter() -> Void {
        count = count - 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minute: time.1, seconds: time.2)
        TimarLabel.text = timeString
    }
    
    
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minute: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minute)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

