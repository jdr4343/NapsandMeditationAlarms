//
//  ViewController.swift
//  NapsandMeditationAlarms
//
//  Created by 신지훈 on 2021/07/26.
//
///http://yoonbumtae.com/?p=3439 타이머
import UIKit
import AVFoundation
//git 나쁜놈

class ViewController: UIViewController {

//스탑버튼
    
    @IBOutlet weak var StopBtn: UIButton!
    
//백색소음 사운드 버튼 생성
    
    @IBOutlet weak var fireSound: UIButton!
    
    @IBOutlet weak var rainSound: UIButton!
    
    @IBOutlet weak var waveSound: UIButton!
    
    @IBOutlet weak var pencilSound: UIButton!
    
    @IBOutlet weak var forestSound: UIButton!
    
    @IBOutlet weak var windSound: UIButton!
    
    @IBOutlet weak var birdSound: UIButton!
    
//뇌 파동 사운드 버튼 생성
    
    @IBOutlet weak var deltaSound: UIButton!
    
    @IBOutlet weak var thetaSound: UIButton!
    
    @IBOutlet weak var betaSound: UIButton!
    
    @IBOutlet weak var alphaSound: UIButton!
    
    
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
    var fire: AVAudioPlayer?
    var wind: AVAudioPlayer?
    var keybord: AVAudioPlayer?
    var pencil: AVAudioPlayer?
    var wave: AVAudioPlayer?
    var forest: AVAudioPlayer?
    var rain: AVAudioPlayer?
    var delta: AVAudioPlayer?
    var theta: AVAudioPlayer?
    var beta: AVAudioPlayer?
    var alpha: AVAudioPlayer?
    var mueum: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
       
    }
   //사이드 메뉴 버튼 구현
    

   
    
    
    //음악 재생
    
    @IBAction func fireTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "불", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                
                guard let urlString = urlString else {
                    return
                }
                fire = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = fire else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        }
    
    
    
    @IBAction func rainTapped() {
            // set up player, and play
        let audioSession = AVAudioSession.sharedInstance()
            let urlString = Bundle.main.path(forResource: "비", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                rain = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = rain else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        }
    
    @IBAction func waveTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "파도소리", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                wave = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = wave else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        
    }
    
    
    @IBAction func pencilTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "연필", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                pencil = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = pencil else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }

    }
    
    @IBAction func forestTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "숲", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                forest = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = forest else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        
    }
    
    @IBAction func windTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "바람소리", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                wind = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = wind else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        }
    
    @IBAction func keybordTapped() {
        let audioSession = AVAudioSession.sharedInstance()
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "키보드", ofType: "mp3")
            do {
               try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                try audioSession.setCategory(AVAudioSession.Category.playback)
                guard let urlString = urlString else {
                    return
                }
                keybord = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = keybord else {
                    return
                }
                player.play()
            }
            catch {
                print("오류가 났어 오류가 이런 젠장!!!")
            }
        
        }
    
   
    @IBAction func deltaTapped() {
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "델타파", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            delta = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = delta else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
    
    }
    
    @IBAction func thetaTapped() {
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "쎄타파", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            theta = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = theta else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
    
    }
    
    @IBAction func betaTapped() {
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "베타파", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            beta = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = beta else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
    
    }
    
    @IBAction func alphaTapped() {
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "알파파", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            alpha = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = alpha else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
    
    }
    
    //스탑버튼
    
    
    @IBAction func stopTapped() {
        SoundStop()
    }
    
    func SoundStop() {
        if let player = fire, player.isPlaying {
            player.stop()
        }
        if let player = wind, player.isPlaying {
            player.stop()
        }
        if let player = rain, player.isPlaying {
            player.stop()
        }
        if let player = pencil, player.isPlaying {
            player.stop()
        }
        if let player = keybord, player.isPlaying {
            player.stop()
        }
        if let player = wave, player.isPlaying {
            player.stop()
        }
        if let player = forest, player.isPlaying {
            player.stop()
        }
        if let player = delta, player.isPlaying {
            player.stop()
        }
        if let player = theta, player.isPlaying {
            player.stop()
        }
        if let player = beta, player.isPlaying {
            player.stop()
        }
       
        if let player = alpha, player.isPlaying {
            player.stop()
    }
}
    
    
    
    
    
    //타이머 세팅 버튼
    @IBAction func resetTapped(_ sender: Any) {
        self.count = 0
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 0, seconds: 0)
        StartStopBtn.setTitle("Start", for: .normal)
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
        SoundStop()
        if let player = mueum, player.isPlaying {
            player.stop()
            print("무음 종료")
        }
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
        self.count = 5400
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 1, minute: 30, seconds: 0)
        
        if(timerCounting) {
            timerCounting = true
            StartStopBtn.setTitle("Stop", for: .normal)
            StartStopBtn.setTitleColor(UIColor.green, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func plus120MinTapped(_ sender: Any) {
        self.count = 10800
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 3, minute: 0, seconds: 0)
        
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
    SoundStop()
//        //꼼수 얍시 앱을 출시할꺼라면 코드 삭제
        print("무음")
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "mueum", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            mueum = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = mueum else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
//        //
        
        
        
        
        
        
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
        if count == -1 {
            Alarm()
            if let player = mueum, player.isPlaying {
                player.stop()
                print("무음 종료")
            }
        }
        if count == -120 {
            Alarm()
        }
        if count == -300 {
            Alarm()
        }
        
    }
    func Alarm() {
        SoundStop()
        let audioSession = AVAudioSession.sharedInstance()
        let urlString = Bundle.main.path(forResource: "삐삐삐삐알람소리", ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try audioSession.setCategory(AVAudioSession.Category.playback)
            guard let urlString = urlString else {
                return
            }
            fire = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = fire else {
                return
            }
            player.play()
        }
        catch {
            print("알람오류")
        }
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







