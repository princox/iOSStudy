//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 박수연 on 2017. 9. 28..
//  Copyright © 2017년 박수연. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate {
    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    @IBAction func save(_ sender: Any) {
        //내용을 입력하지 않았을경우,경고한다.
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil,message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        
        
        //data 담는다
        let data = MemoData()
        
        data.title = self.subject//제목
        data.contents = self.contents.text //내용
        data.image = self.preview.image //이미지
        data.regdate = Date() //작성시간//왜 오류가 나지?->data ㄴㄴ date oo
        
        //앱 델리게이트 객체를 읽어온 다음
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false)
    }
    
    //텍스트뷰의 내용이 변경될때 마다 호출되는 델리게이트 메소드:내용이 변경될때마다 제목이 변경되는 로직 설정할수있다.
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0,length: length) )
        
        //네비게이션 타이틀에   표시된다
        self.navigationItem.title = subject
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.contents.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
