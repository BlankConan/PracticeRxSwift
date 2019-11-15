//
//  ViewController.swift
//  PracticeRxSwift
//
//  Created by gang yi liu on 2019/10/26.
//  Copyright © 2019 liugangyi. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import HandyJSON

class ViewController: UIViewController {

    struct ServerRresult<T:HandyJSON>: HandyJSON {
        var code:Int = 0
        var data: T?
        var dataList: [T]?
        var msg:String?
        mutating func mapping(mapper: HelpingMapper) {
            
        }
    }
    
    struct Product:HandyJSON {
        
        var arrangedCount = 0
        var classTime:String = ""
        var subjectTypeId:String = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseUrl = "http://test03-wangxiao.coolmath.cn"
        let path = "/mobile/course/list.json"
        let allPath = baseUrl+path
        let paragram = ["subjectTypeId":"94","pageSize":"1","pageNum":"1"]

        
        
        AF.request(allPath, method: .post, parameters: paragram, encoding: URLEncoding.default).responseJSON { response in
            print(response.value! as! NSDictionary)
            let result = ServerRresult<Product>.deserialize(from: response.value as! NSDictionary)
        }
        
        
        
    }
    
}
