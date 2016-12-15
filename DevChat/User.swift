//
//  User.swift
//  DevChat
//
//  Created by Evgeny Vlasov on 12/6/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

struct User {
  
    private var _firstName: String
    private var _uid: String
    
    var firstName: String {
        return _firstName
    }
    
    var uid: String {
        return _uid
    }
    
    init (uid: String, firstName: String) {
        _firstName = firstName
        _uid = uid
    }
}
