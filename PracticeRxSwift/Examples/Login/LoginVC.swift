//
//  LoginVC.swift
//  PracticeRxSwift
//
//  Created by Cocoa on 2020/5/29.
//  Copyright © 2020 liugangyi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private let minimalUsernameLength = 5
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var usernameTip: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordTip: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 用户名是否有效
        let usernameValid = usernameTF.rx.text.orEmpty.map{$0.count > self.minimalUsernameLength }.share(replay: 1)
        
        // 密码是否有效
        let passwordValid = passwordTF.rx.text.orEmpty.map { $0.count > self.minimalUsernameLength }.share(replay: 1)
        
        // 用户名和密码是否都OK
        let everythingOk = Observable.combineLatest(usernameValid, passwordValid).map { $0 && $1 }.share(replay: 1)
        
        // 事件绑定
        usernameValid
            .bind(to: usernameTip.rx.isHidden)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind(to: passwordTF.rx.isEnabled)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: passwordTip.rx.isHidden)
            .disposed(by: disposeBag)
        
        everythingOk
            .bind(to: doneBtn.rx.isUserInteractionEnabled)
            .disposed(by: disposeBag)
        
        doneBtn.rx.tap
            .subscribe(onNext: { [weak self] in self?.showAlert() })
            .disposed(by:disposeBag)
        
        
    }
    
    
}

// MARK: 第一版
extension LoginVC {
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Tips", message: "xxxxxx", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { [weak self]_ in
            self?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
