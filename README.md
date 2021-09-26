# NapsandMeditationAlarms





https://user-images.githubusercontent.com/85167689/127617106-f7426159-d1dc-4f7d-a633-60c677f508ff.mov

동영상이 안보일경우 사파리로 보면 보입니다.



간단한 시간 타이머 지정과 알람 그리고 각종 잠, 명상 혹은 공부에 도움되는 사운드들을 넣었고 그 사운드들을 섞어서 사용할수 있도록 했습니다. 

유튜브를 보다보면 불멍소리 + 델타파 ,파도소리 + 쎄타파 이런식으로 지정 되어 있는걸 보고 영감을 얻어서 만들게 된 심플하고 간단한 앱입니다.

타이머가 -1초 -120초 -300초 별로 별도의 알람을 설정해 놓았고 백그라운드에서 오디오가 재생되게 만들어 놨습니다.

테스트 결과 정상 작동을 하였습니다.

사운드는 불,비,파도,필기,숲,바람,키보드 소리로 만들었습니다.(저는 개인적으로 키보드 + 바람 소리가 좋았습니다.)

뇌 파동은 델타파 세타파 베타파 알파파로 별도의 상황마다 대응 가능하게 만들었습니다.

잠을 자려고 한다면 델타파 세타파를 공부를 하거나 명상을 한다면 베타파와 알파파로 집중에 도움되게 만들었습니다.

별도의 시간을 지정하고 싶지 않은 사람들을 위해 타이머를 굳이 안키더라도 음악을 재생하고 멈출수 있도록 재생중지 버튼을 따로 만들었습니다.

알람을 쉽게 끌수 있도록 스톱버튼과 재생중지 버튼 둘다 알람을 끌수 있도록 구현했습니다.

간단한 구현 방법 설명겸 복습을 하겠습니다.

```swift
import UIKit
import AVFoundation

//시간 추가 버튼구현
@IBOutlet weak var plus10MinBtn: UIButton!
//버튼 탭 이벤트
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
//타입 스트링 구현
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
```

우선은 간단한 시간 추가 버튼은 UIButton!으로 Outlet을 연결하고 액션은 none 타입으로 연결한후 코드를 작성하였습니다. 간단한 초단위 count를 생성하고  화면에 보여지는 Label을 설정했습니다. settitle의 컬러와 내용을 변경하였고 scheduledTimer를 이용해 시간이 가게 했습니다.

```swift
//타이머 생성
    @IBOutlet weak var TimarLabel: UILabel!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var StartStopBtn: UIButton!
//타이머 기본값
var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false

**override func viewDidLoad() {
        super.viewDidLoad()
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
       
    }**

//리셋 버튼
@IBAction func resetTapped(_ sender: Any) {
        self.count = 0
        self.timer.invalidate()
        self.TimarLabel.text = self.makeTimeString(hours: 0, minute: 0, seconds: 0)
        StartStopBtn.setTitle("Start", for: .normal)
        StartStopBtn.setTitleColor(UIColor.green, for: .normal)
        SoundStop()
    }

//스탑버튼
@IBAction func startStopTapped(_ sender: Any) {
    SoundStop()
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
        }
        if count == -120 {
            Alarm()
        }
        if count == -300 {
            Alarm()
        }
        
    }
//알람 사운드 함수
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
func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
```

리셋버튼액션에서는 sender를 채택했고 탭시 카운트를 0 으로 만들었습니다.그리고 동시에 타임스트링을 
기본값으로 주어 사용자가 초기화 된걸 인지 하도록 하였습니다.
스타트스탑액션에서는 사운드를 멈추고 타임카운팅을 멈추거나 시작하게 구성했습니다.

타임카운터에서는 시간이 1초씩 줄도록 만들었고 secondsToHoursMinutesSeconds 아래의 함
수를 가져와 시,분,초를 구성했습니다.그리고 정해진 분기점 시간마다 Alarm()함수가 재생되도록 하였습니다.

알람 함수에 대한 내용은 아래의 사운드 구현에서 설명하겠습니다.

```swift
//사운드 구현
@IBOutlet weak var fireSound: UIButton!
@IBOutlet weak var StopBtn: UIButton!

var fire: AVAudioPlayer?

**@IBAction func fireTapped() {
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
//스탑버튼
    
    @IBAction func stopTapped() {
        SoundStop()
    }

func SoundStop() {
        if let player = fire, player.isPlaying {
            player.stop()
        }**
```

AVFoundation import 해서 오디오 플레이어를 구현했습니다. fireTapped Action에서는 백그라운드에서 재생하기위에 sharedInstance 와 Category를 설정해주고 제너럴의 Resource Tags 에서 Background Modes를 연결 한다음 Audio,AirPlay, and Picture in Picture 체크 박스를 체크하여 재생 시켰습니다.

urlString에서 sound이름을 설정하여 재생할 sound를 선택하였습니다.그리고 do catch블럭을 사용하여 별도의 디버깅에 대비하였고  위에서 설정한 fire AVAudioPlayer?에 여러가지 코드를 연결하였습니다.

