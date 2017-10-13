//
//  CSLogButton.swift
//  DGMemory
//
//  Created by INDAM94 on 2017. 10. 13..
//  Copyright © 2017년 DGE. All rights reserved.
//

import UIKit

public enum CSLogType: Int{
    case basic
    case title
    case tag
}

public class CSLogButton: UIButton{
    public var logType: CSLogType = .basic
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setBackgroundImage(UIImage(named: "buttonBg.png"), for: .normal)
        self.tintColor = UIColor.red
        
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    @objc func logging(_ sender: UIButton){
        switch self.logType {
        case .basic:
            NSLog("버튼이 클릭되었습니다.")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"
            NSLog("\(btnTitle) 버튼이 클릭되었습니다")
        case .tag:
            NSLog("\(sender.tag) 버튼이 클릭되었습니다")
        }
    }
}
