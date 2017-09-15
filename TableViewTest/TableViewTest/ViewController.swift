//
//  ViewController.swift
//  TableViewTest
//
//  Created by INDAM94 on 2017. 9. 15..
//  Copyright © 2017년 DGE. All rights reserved.
//

import UIKit

let data = ["cell1", "cell2", "cell3", "cell4", "cell5", "cell6", "cell7", "cell8", "cell9", "cell10"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, YourCellDelegate {
    @IBOutlet weak var TableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableVIew.delegate = self
        TableVIew.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cellLabel : String = indexPath.row.description
        
        let cell = TableVIew.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        
        cell.delegate = self
        //cell.TableLabel.setTitle(cellLabel, for: .normal)
        
        //cell.TableLabel.titleLabel?.text = "1"
        
        //재사용 셀에 대해 프로퍼티 호출
        cell.ButtonHandler = {()-> Void in
            print(indexPath.row + 100)
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellLabel : String = indexPath.row.description
        
        let Alert = UIAlertController(title: cellLabel, message: cellLabel, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "OK", style: .default)
        
        Alert.addAction(confirm)
        
        self.present(Alert, animated: false, completion: nil)
    }
    
    
    
    func didTapButton(index: IndexPath) {
        print(index)
    }
    

}

