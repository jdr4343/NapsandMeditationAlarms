//
//  ComposeViewController.swift
//  FirstToyProject
//
//  Created by 신지훈 on 2021/07/03.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //모달방식을 닫을때는 dismiss 메소드를 사용.
    }
    
    @IBOutlet weak var MemoTextView: UITextView!
    
    @IBAction func SaveBtn(_ sender: Any) {
        guard let memo = MemoTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요")
            return
            //사용자가 메모를 입력하지 않으면 경고창이 표시되고 메소드가 종료 됩니다.반대로 메모를 정상적으로 입력했다면 가드문 다음에 있는 코드가 실행 됩니다.
        }
        
       //let newMemo = Memo(content: memo)
       //Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        // 이코드는 라디오 방송국에서 라디오 방송을 브로드캐스트하는것과 같습니다.  
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMamoDidInsert")
    //라디오 방송국의 주파수 라고 생각하면 됨 라디오는 주파수로 구분하지만 노티는 이름으로 구분함
}
