//
//  User.swift
//  FirebaseBasic
//
//  Created by 이윤진 on 2020/01/02.
//  Copyright © 2020 이윤진. All rights reserved.
//

struct User:Codable {
    let name:String
    let email:String
    
    init(name:String, email:String){
        self.name = name
        self.email = email
    }
    
}
