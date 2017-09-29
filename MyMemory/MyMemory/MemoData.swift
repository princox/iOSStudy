//
//  MemoData.swift
//  MyMemory
//
//  Created by Minki on 2017. 9. 4..
//  Copyright © 2017년 Minki. All rights reserved.
//
/**
 Data Model (Domain Model)
 
 */
import UIKit

class MemoData {
    var memoIdx: Int?       // 데이터 식별값
    var title: String?      // 메모 제목
    var contents: String?   // 메모 내용
    var image: UIImage?     // 이미지
    var regdate: Date?      // 작성일
}
