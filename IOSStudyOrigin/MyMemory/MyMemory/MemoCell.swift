//
//  MemoCell.swift
//  MyMemory
//
//  Created by 박수연 on 2017. 9. 28..
//  Copyright © 2017년 박수연. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {
    @IBOutlet var subject: UILabel!//제목
    @IBOutlet var contents: UILabel!//내용
    @IBOutlet var img: UIImageView!//일자
    @IBOutlet var regdate: UILabel!//이미지
    
    class MemoListVC: UITableViewController {
     // 앱 델리게이트 객체의 참조정보를 가저옴
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       //화면이 나타날때마다 나타나는 메소드
        override func viewWillAppear(_ animated: Bool) {
            
        }
        //테이블 행의 개수
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           let count = self.appDelegate.memolist.count
            return count
        }
        //행을 구성
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let row = self.appDelegate.memolist[indexPath.row]
            
            let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
         
            //4.memoCell 내용 구성
            cell.subject?.text = row.title
            cell.contents?.text = row.contents
            cell.img?.image = row.image
            
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:ss"
            
            cell.regdate?.text = formatter.string(from: row.regdate!)
            
            return cell
            
        }
        //태이블의 특정행이 실행됬을때 호출되는 메소드
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            <#code#>
        }
    }
    
    
   //삭제
    

}
