//
//  SettingViewController.swift
//  OddEvenGame
//
//  Created by 조영익 on 2022/03/07.
//

import UIKit

protocol SettingDelegate {
    func getBallsCount(ballsCount: Int)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var ballsCountTf: UITextField!
    
    var settingDelegate: SettingDelegate?
    
    var defaultBallsCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //다크모드지원하기 위한 배경색상 지정
        self.view.backgroundColor = UIColor(named: "customBackground")
        // Do any additional setup after loading the view.
        ballsCountTf.delegate = self
        
        //way2 화면 여백을 클릭 했을 때 키보드가 내려가도록 설정
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func completeBtnPressed(_ sender: Any) {
        
        guard let ballsStr = self.ballsCountTf.text, let balls = Int(ballsStr) else {
            self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
            self.dismiss(animated: true, completion: nil)
            return
        }
    
        self.settingDelegate?.getBallsCount(ballsCount: balls)
        self.dismiss(animated: true, completion: nil)
    }
}

//way1 textfeild의 return 버튼을 클릭시 키보드가 내려가도록 설정
extension SettingViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.ballsCountTf.resignFirstResponder()
        return true
        
    }

}
