//
//  InputViewController.swift
//  DelegatePatternDemo
//
//  Created by 조영익 on 2022/03/07.
//

import UIKit

protocol UserInfoDelegate {
    func getUserInfo(name: String, age: String)
}

class InputViewController: UIViewController {

    var delegate: UserInfoDelegate?
    
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var userAgeTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func setUserInfo(_ sender: UIButton) {
        
        guard let userName = self.userNameTf.text , let userAge = self.userAgeTf.text else {
            print("사용자 정보가 없습니다.")
            return
        }

        
        self.delegate?.getUserInfo(name: userName, age: userAge)
        self.navigationController?.popViewController(animated: true)
    }
    
}
