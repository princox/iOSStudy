//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by Minki on 2017. 9. 4..
//  Copyright © 2017년 Minki. All rights reserved.
//

import UIKit
import Foundation

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    var subject: String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    /**
     1. 메모 내용이 입력되지 않았을 경우, 경고창을 띄워 알려준다.
     2. 데이터 저장할 MemoData객체를 생성하고, 제목, 내용, 이미지, 작성 시각을 MemoData 객체에 정의된 속성에 대입한다.
     3. 앱 델리게이트 인스턴스를 읽어온 다음, memoList 배열 변수에 방금 생성한 MemoData 객체를 추가한다.
     4. 메모작성화면을 종료하고 이전화면으로 되돌아간다.
     */
    // 저장 버튼 호출
    @IBAction func save(_ sender: UIBarButtonItem) {
        // 경고창에 사용될 콘텐츠 뷰 컨트롤러 구성
        let alertV = UIViewController()
        let iconImage = UIImage(named: "warning-icon-60")
        alertV.view = UIImageView(image: iconImage)
        alertV.preferredContentSize = iconImage?.size ?? CGSize.zero
        
        // 1. 내용을 입력하지 않았을 경우, 경고한다.
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.setValue(alertV, forKey: "contentViewController")
            self.present(alert, animated:true)
            return
        }
        
        // 2. MemoData 객체를 생성하고, 데이터를 담는다.
        let data = MemoData()
        data.title = self.subject // 제목
        data.contents = self.contents.text   // 내용
        data.image = self.preview.image // 이미지
        data.regdate = Date()   // 작성시간
        
        // 3. 앱 델리게이트 객체를 읽어온 다음, memoList 배열에 MemoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        // 4. 작성폼 화면을 종료하고, 이전 화면으로 돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 카메라 버튼 호출
    @IBAction func pick(_ sender: UIBarButtonItem) {
        // 이미지 피커 컨트롤러 인스턴스 생성한다.
        let picker = UIImagePickerController()
        
        // 이미지 피커 컨트롤러 인스턴스의 델리케이트 속성을 현재의 뷰 컨트롤러 인스턴스로 설정한다.
        picker.delegate = self
        //이미지 피커 컨트롤러의 이미지 편집을 허용한다.
        picker.allowsEditing = true
        
        // 이미지 피커 화면을 표시한다.
        self.present(picker, animated: false)
    }
    
    // 이미지 선택을 완료했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 선택된 이미지를 미리보기에 표시한다.
        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        self.contents.delegate = self
        
        let bgImage = UIImage(named: "memo-background")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        // 텍스트 뷰의 기본속성
        self.contents.layer.borderWidth = 0
        self.contents.layer.borderColor = UIColor.clear.cgColor
        self.contents.backgroundColor = UIColor.clear
        
        // 줄간격
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
//        self.contents.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedStringKey.paragraphStyle: style])
        self.contents.text = ""
    }

    func textViewDidChange(_ textView: UITextView) {
        // 내용의 최대 15자리까지 읽어 subject 변수에 저장한다. - textView의 내용을 읽어 NSString 타입의 변수에 저장한다.
        let contents = textView.text as NSString
        // 읽어온 내용이 15자리보다 길면 15자리고, 짧으면 전체를 읽는다.
        let length = ((contents.length > 15) ? 15 : contents.length)
        // 최대 15자리까지의 내용을 subject변수에 저장한다. 이 값이 제목이 된다.
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        // 뽑아낸 제목을 네비게이션 타이틀에 표시한다.
        self.navigationItem.title = subject
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bar = self.navigationController?.navigationBar

        bar?.isHidden = !bar!.isHidden
//        let ts = TimeInterval(0.3)
//        UIView.animate(withDuration: ts) {
//            bar?.alpha = (bar?.alpha == 0 ? 1: 0)
//        }
    }
}
