//
//  DetailViewController.swift
//  FirstToyProject
//
//  Created by 신지훈 on 2021/07/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var memoTableView: UITableView!
    
    var memo: Memo?
    
    let formatter: DateFormatter = {
    let f = DateFormatter ()
     f.dateStyle = .long
     f.timeStyle = .short
     f.locale = Locale(identifier: "ko_kr")
     return f
 }()
    //이전 화면에서 전달한 메모를 저장할 속성을 추가 하겠습니다. 뷰 컨트롤러가 초기화 되는 시점에는 값이 없기때문에 옵셔널로 저장하겠습니다.
    
    
 //툴바에 있는 버튼을 탭할떄 Segue가 실행됩니다. memo 속성에 저장되어 있는 memo를 그대로 전달하겠습니다. 다만 앞에서 설명했던것처럼 navigationController거쳐서 전달하기 떄문에 최종뷰 Controller에 접근하는 코드가 좀 달라집니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController {
            vc.editTarget = memo
            //네비게이션 컨트롤러가 관리하는 첫번째 뷰 컨트롤러로 메모가 전달됩니다. 여기에서 네비게이션 컨트롤러가 관리하는 첫번쨰 뷰 컨트롤러는 ComposeViewController 입니다. 다시 ComposeViewController로 가겠습니다.
        }
    }
    var token: NSObjectProtocol?
    //이속성에는 NSObjectProtocol 토큰을 저장하겠습니다.
    //옵저버를 해제하는 코드를 구현하겠습니다.
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //옵저버를 추가하겠습니다. 이렇게 memodidChange에 옵저버를 추가했습니다. 그리고 여기에서 TableView를 reload 하겠습니다.
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memodidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.memoTableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    }
    
    
}
