//
//  ViewController.swift
//  NapsandMeditationAlarms
//
//  Created by 신지훈 on 2021/07/26.
//
///http://yoonbumtae.com/?p=3439 타이머
import UIKit
import AVFoundation
import SideMenu

class ViewController: UIViewController {

    @IBOutlet var holder: UIView!
    
//음악 플레이어 생성

    
    @IBOutlet weak var musicPlayStopBtn: UIButton!
    
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
    
    //사이드 메뉴 생성
    var menu: SideMenuNavigationController?
    
    //타이머
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    //오디오
    var player: AVAudioPlayer?
    //unother
   public var position: Int = 0
   public var songs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
        //rootview 초기화
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        //메뉴 오른쪽으로 구현
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        print(songs)
            }
    

   
    //unother
    func configure() {
       let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.name, ofType: "mp3")
        do {
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                return
            }
            player.play()
        }
        catch {
            print("오류가 났어 오류가 이런 젠장!!!")
        }
    }
    
    
    
    
    
    
   //사이드 메뉴 버튼 구현
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }
    
    
    
    
    
    
    
    //음악 재생
//    @IBAction func musicPlayStopTapped() {
//        let song = songs[position]
//        if let player = player, player.isPlaying {
//            //stop playback
//            player.stop()
//        } else {
//            // set up player, and play
//            let urlString = Bundle.main.path(forResource: song.name, ofType: "mp3")
//            do {
//               try AVAudioSession.sharedInstance().setMode(.default)
//                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//
//                guard let urlString = urlString else {
//                    return
//                }
//                player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
//
//                guard let player = player else {
//                    return
//                }
//                player.play()
//            }
//            catch {
//                print("오류가 났어 오류가 이런 젠장!!!")
//            }
//
//        }
//    }
    
    
    
    
    
    
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

//슬라이드 메뉴 뷰 구성 UI tableView 하위 클래스로 생성
class MenuListController: UITableViewController {
    
    @IBOutlet var musicTable: UITableView!
        
    
    //메뉴 배열 생성
    var songs = [Song]()
    //셀설정
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    func configureSongs() {
        songs.append(Song(name: "장기기억력을 높이는 6Hz 세타파"))
        songs.append(Song(name: "회복 수면2 Hz델타파"))
    
    }
    //셀 높이 조절
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //행수 반환
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        
       //글자 크기 조정
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 12 )
        
        
        
        
        return cell
        //cell identifier을 지정을 못해주네..
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? ViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}


struct Song {
    let name: String
  
}
