//
//  DetailViewController.swift
//  FirstToyProject
//
//  Created by 신지훈 on 2021/07/03.
//

import UIKit

class DetailViewController: UIViewController {

    var memo: Memo?
    
    let formatter: DateFormatter = {
    let f = DateFormatter ()
     f.dateStyle = .long
     f.timeStyle = .short
     f.locale = Locale(identifier: "ko_kr")
     return f
 }()
    //이전 화면에서 전달한 메모를 저장할 속성을 추가 하겠습니다. 뷰 컨트롤러가 초기화 되는 시점에는 값이 없기때문에 옵셔널로 저장하겠습니다.
    override func viewDidLoad() {
        super.viewDidLoad()

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
