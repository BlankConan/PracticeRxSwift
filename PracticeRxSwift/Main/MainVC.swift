//
//  MainVC.swift
//  PracticeRxSwift
//
//  Created by gang yi liu on 2019/10/26.
//  Copyright © 2019 liugangyi. All rights reserved.
//

import UIKit
import Foundation

class MainVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func buttonAction(_ sender: Any) {
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

