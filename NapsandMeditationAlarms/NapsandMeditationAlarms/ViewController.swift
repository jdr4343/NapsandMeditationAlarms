//
//  ViewController.swift
//  NapsandMeditationAlarms
//
//  Created by 신지훈 on 2021/07/26.
//
///http://yoonbumtae.com/?p=3439 타이머
import UIKit

class ViewController: UIViewController {
    
//타이머 생성
    let timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    
    @objc func fire() {
        print("Fire!!!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

