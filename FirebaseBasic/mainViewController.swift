//
//  mainViewController.swift
//  FirebaseBasic
//
//  Created by 이윤진 on 2020/01/02.
//  Copyright © 2020 이윤진. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth
class mainViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plzLogout(_ sender: UIButton) {
        
        guard let user = Auth.auth().currentUser else{
               return
           }
           do{
               try Auth.auth().signOut()
               NSLog("로그아웃 성공")
           }catch{
               NSLog("로그아웃 실패")
           }
    }
}
