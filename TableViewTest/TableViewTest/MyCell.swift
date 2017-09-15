//
//  MyCell.swift
//  TableViewTest
//
//  Created by INDAM94 on 2017. 9. 15..
//  Copyright © 2017년 DGE. All rights reserved.
//

import UIKit

protocol YourCellDelegate: class {
    func didTapButton(index: IndexPath)
}

class MyCell : UITableViewCell {
    
    weak var delegate: YourCellDelegate!
    var indexPath: IndexPath!
    
    //셀 클래스 계산 프로퍼티 선언
    var ButtonHandler:(()-> Void)!
    
    @IBOutlet var TableLabel: UIButton!
    @IBAction func TableTapBtn(_ sender: UIButton) {
        delegate.didTapButton(index: indexPath)
        
        //액션 내부에 프로퍼티 호출
        self.ButtonHandler()
    }
}
