//
//  ViewController.swift
//  NapsandMeditationAlarms
//
//  Created by 신지훈 on 2021/07/26.
//
///http://yoonbumtae.com/?p=3439 타이머
import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    
//백색소음 사운드 버튼 생성
    
    @IBOutlet weak var fireSound: UIButton!
    
    @IBOutlet weak var rainSound: UIButton!
    
    @IBOutlet weak var waveSound: UIButton!
    
    @IBOutlet weak var pencilSound: UIButton!
    
    @IBOutlet weak var forestSound: UIButton!
    
    @IBOutlet weak var windSound: UIButton!
    
    @IBOutlet weak var birdSound: UIButton!
    
//뇌 파동 사운드 버튼 생성
    
    
    
    
    
    
    
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
    
//    //사이드 메뉴 생성
//    var menu: SideMenuNavigationController?
    
    //타이머
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    //오디오
    var player: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
       
    }
   //사이드 메뉴 버튼 구현
    
  
    
    
    
    
    //음악 재생
    @IBAction func musicPlayStopTapped() {
        if let player = player, player.isPlaying {
            //stop playback
            player.stop()
        } else {
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "장기기억력을 높이는 6Hz 세타파", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        }
    }
    //불 https://www.youtube.com/watch?v=N_g3AiXF-q8
    //파도 https://www.youtube.com/watch?v=HFdvqNrL-7M
    //자연 https://www.youtube.com/watch?v=FtcFhABKdMY
    //바람 https://www.youtube.com/watch?v=09mQW9ijOHg
    //연필 https://www.youtube.com/watch?v=pVVINnUhMxg&t=2231s
    //빗소리 https://www.youtube.com/watch?v=HrO74lj5QBs
    //키보드 https://www.youtube.com/watch?v=frlCGmPcLFw&list=PLnVlRUss9rndgEPLCbnA4ouTG8BYmrM0Y&index=3
    
    
    
    
    //타이머 세팅 버튼
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
    
    
    
    
    
    //재생,스탑 버튼 구현
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
    
    
    //시간과 레이블 스트링 구현
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







