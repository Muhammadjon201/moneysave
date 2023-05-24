//
//  extension.swift
//  moneysave
//
//  Created by ericzero on 5/24/23.
//

import UIKit

extension UIButton {
    
    func applyCommonBtnStyle(){
        layer.cornerRadius = 8
    }
    
    func applySignUpStyle(){
        applyCommonBtnStyle()
        setTitle("Sign Up", for: .normal)
        let signUpBtnColor = UIColor(named: "launchColor")
        backgroundColor = signUpBtnColor
    }
    
    func applyLogInStyle(){
        applyCommonBtnStyle()
        setTitle("Login", for: .normal)
        setTitleColor(UIColor(named: "launchColor"), for: .normal)
        let loginColor = UIColor(named: "signInColor")
        backgroundColor = loginColor
    }
}
