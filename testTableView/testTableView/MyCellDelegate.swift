//
//  MyCellDelegate.swift
//  testTableView
//
//  Created by JeongHoonRhee on 2017. 9. 3..
//  Copyright © 2017년 princox. All rights reserved.
//

import Foundation
import UIKit

protocol MyCellDelegate: class { // 클래스만 이 프로토콜을 쓸 수 있다. - delegate
    func didPressButton(_ tag: Int)
}
