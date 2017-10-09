//
//  MemoListVC.swift
//  MyMemory
//
//  Created by Minki on 2017. 9. 4..
//  Copyright © 2017년 Minki. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // 테이블 행의 개수를 결정하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memoList.count
        return count
    }
    
    // 테이블의 행을 구성하는 메소드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 2. 이미지 속성이 비어 있을 경우 "memoCell", 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 3. 재사용 큐로뷰터 프로토타입 셀의 인스턴스를 전달받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MemoCell
        
        // 4. memoCell의 내용을 구성한다.
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // 5. Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경한다.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regDate?.text = formatter.string(from: row.regdate!)
        
        // 6. cell 객체를 리턴한다.
        return cell
    }
    
    /** 해당 ViewController(화면)가 디바이스의 스크린에 나타날 때마다 호출되는 메소드
     1. 다른 화면으로 이동했다가 다시 목록으로 돌아왔을 때
     2. 홈버튼을 눌러 앱이 백그라운드 모드로 내려간 후 다시 활성화 되었을 때
     3. 기타 상황으로 뷰 컨트롤러가 스크린에 표시될 때
     
     *** 주의 ***
      viewDidLoad메소드는 최초에 뷰가 로드되는 시점 한 번만 호출된다.
      매번 테이블 뷰를 로드하려면 viewWillAppear를 사용해야한다.
     
     viewWillAppear -> 뷰컨트롤러가 화면에 표시된다. -> viewDidAppear
     
     */
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
    }
    // 테이블의 특정 행이 선택되었을 때 호출되는 메소드, 선택된 행의 정보는 indexPath에 담겨 전달된다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 2. 상세 화면의 인스턴스를 생성한다.
        // Identity Inspector에서 설정한 StoryBoardID를 이용하여 상세화면의 인스턴스 vc를 생성한다. vc는 UIViewController 타입이므로 우리에게 필요한 MemoReadVC 클래스로 캐스팅해야한다. 만약 MemoRead에 해당하는 StoryBoardID가 없으면 메소드의 실행을 종료한다.
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        
        // 3. 값을 전달한 다음, 상세 화면으로 이동한다.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
