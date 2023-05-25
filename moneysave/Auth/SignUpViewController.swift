//
//  SignUpViewController.swift
//  moneysave
//
//  Created by ericzero on 5/24/23.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private var isChecked = false
    
    lazy var tickBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "checkNo"), for: .normal)
        btn.addTarget(self, action: #selector(tickBtnTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sign Up"
        setConstraints()
    }
    
}

extension SignUpViewController {
    
    func setConstraints(){
        let nameField = TextfieldFactory.createTextField(placeholder: "Name", color: UIColor.systemGray5)
        let emailField = TextfieldFactory.createTextField(placeholder: "Email", color: UIColor.systemGray5)
        let passwordField = TextfieldFactory.createTextField(placeholder: "Password", color: UIColor.systemGray5)
        
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(tickBtn)
        
        nameField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(24)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(24)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
        
        tickBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.height.width.equalTo(32)
        }
    }
    
    @objc func tickBtnTapped(){
        isChecked.toggle()
        if isChecked {
            tickBtn.setImage(UIImage(named: "checkYes"), for: .normal)
        } else {
            tickBtn.setImage(UIImage(named: "checkNo"), for: .normal)
        }
    }
}
