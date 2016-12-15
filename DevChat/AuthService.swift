//
//  AuthService.swift
//  DevChat
//
//  Created by Evgeny Vlasov on 12/4/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data:AnyObject?) -> Void


class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email:String, password:String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                
                            } else {
                                if user?.uid != nil {
                                    // Sign in
                                    
                                    DataService.instance.saveUser(uid: user!.uid) 
                                    
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                            
                                        } else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    } else {
                        self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                    }
                }
                
            } else {
                // Successfully loged in
                onComplete?(nil, user)
            }
            
            
        })
        
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                // show to user the error
                onComplete?("Invalid Email", nil)
                break
                
            case .errorCodeWrongPassword:
                // show to user the error
                onComplete?("Invalid Password", nil)
                break
                
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Couldn't create account, email already in use", nil)
                break
                
            default:
                onComplete?("There was a problem authenticating. Try again", nil)
                
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
