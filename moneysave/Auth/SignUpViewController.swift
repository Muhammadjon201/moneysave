//
//  SignUpViewController.swift
//  moneysave
//
//  Created by ericzero on 5/24/23.
//

import UIKit

final class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sign Up"
        setConstraints()
    }
    
}

extension SignUpViewController {
    
    func setConstraints(){
        let nameField = TextfieldFactory.createTextField(placeholder: "Name", color: UIColor.systemGray3)
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
    }
}
