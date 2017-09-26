//
//  ViewController.swift
//  testTableView
//
//  Created by JeongHoonRhee on 2017. 9. 3..
//  Copyright © 2017년 princox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.cellDelegate = self
        cell.tag = indexPath.row
        print("tags: \(cell.tag)")
        return cell
    }
    
    func didPressButton(_ tag: Int) {
        print("버튼 눌림: \(tag)")
        let dialog = UIAlertController(title: "\(tag)", message: "\(tag)번이 눌렸습니다.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        
        self.present(dialog, animated: true, completion: nil)
    }
}














