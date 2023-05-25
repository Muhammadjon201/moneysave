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
    
    lazy var policyBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("By signing up, you agree to the Terms of Service and Privacy Policy", for: .normal)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor(named: "launchColor"), for: .normal)
        btn.addTarget(self, action: #selector(policyBtnTapped), for: .touchUpInside)
        return btn
    }()

    lazy var orLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Or with"
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var haveAnAccount: UILabel = {
        let lbl = UILabel()
        lbl.text = "Already have an account?"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(UIColor(named: "launchColor"), for: .normal)
        btn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        let attributedString = NSAttributedString(string: "Login", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        btn.setAttributedTitle(attributedString, for: .normal)

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
        let signUpBtn = CustomButtonFactory.createButton(title: "Sign Up", color: UIColor(named: "launchColor")!)
        signUpBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        let googleSignUp = CustomButtonFactory.createButton(title: "Sign Up with Google", color: .white)
        googleSignUp.setTitleColor(.black, for: .normal)
        googleSignUp.setImage(UIImage(named: "google"), for: .normal)
        googleSignUp.layer.borderWidth = 0.3
        googleSignUp.addTarget(self, action: #selector(googleSignUpTapped), for: .touchUpInside)
       
        
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(tickBtn)
        view.addSubview(policyBtn)
        view.addSubview(signUpBtn)
        view.addSubview(orLbl)
        view.addSubview(googleSignUp)
        view.addSubview(haveAnAccount)
        view.addSubview(loginBtn)
        
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
        
        policyBtn.snp.makeConstraints { make in
            make.centerY.equalTo(tickBtn)
            make.left.equalTo(tickBtn.snp.right).offset(5)
            make.right.equalTo(-20)
        }
        
        signUpBtn.snp.makeConstraints { make in
            make.top.equalTo(policyBtn.snp.bottom).offset(25)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
        
        orLbl.snp.makeConstraints { make in
            make.top.equalTo(signUpBtn.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        googleSignUp.snp.makeConstraints { make in
            make.top.equalTo(orLbl.snp.bottom).offset(12)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(56)
        }
        
        haveAnAccount.snp.makeConstraints { make in
            make.top.equalTo(googleSignUp.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
        }
        
        loginBtn.snp.makeConstraints { make in
            make.centerY.equalTo(haveAnAccount)
            make.left.equalTo(haveAnAccount.snp.right).offset(5)
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
    
    @objc func signUpBtnTapped(){
        print("signUpBtnTapped")
    }
    
    @objc func policyBtnTapped(){
        print("terms worked")
    }
    
    @objc func googleSignUpTapped(){
        print("google tapped")
    }
    
    @objc func loginTapped(){
        print("login tap")
    }
}
