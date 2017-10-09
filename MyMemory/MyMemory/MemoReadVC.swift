//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by Minki on 2017. 9. 4..
//  Copyright © 2017년 Minki. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    var param: MemoData?
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 불러온 제목, 내용, 이미지 데이터 가져오기.
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 2. 날짜 포맷 변환
        let formatter = DateFormatter() // 생성자
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"    // dateformat 설정
        let dateString = formatter.string(from: (param?.regdate)!) // 불러온 작성 날짜를 string으로 변환(위의 포맷에 맞게)
        self.navigationItem.title = dateString  // 변환한 string을 navigationItem의 제목에 대입
    }

}
