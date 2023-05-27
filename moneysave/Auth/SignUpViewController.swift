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
        
        let tickButtonStack = UIStackView(arrangedSubviews: [tickBtn, policyBtn])
        tickButtonStack.axis = .horizontal
        tickButtonStack.spacing = 10
        
        let loginStackView = UIStackView(arrangedSubviews: [haveAnAccount, loginBtn])
        loginStackView.axis = .horizontal
        loginStackView.spacing = 5

        let verticakStackView = UIStackView(arrangedSubviews: [nameField, emailField, passwordField, tickButtonStack, signUpBtn, orLbl, googleSignUp, loginStackView])
        verticakStackView.axis = .vertical
        verticakStackView.alignment = .center
        verticakStackView.spacing = 24
        
        view.addSubview(verticakStackView)
        verticakStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }

        tickButtonStack.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }

        nameField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalToSuperview().multipliedBy(0.09)
        }

        emailField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalToSuperview().multipliedBy(0.09)
        }

        passwordField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalToSuperview().multipliedBy(0.09)
        }

        signUpBtn.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalToSuperview().multipliedBy(0.09)
        }

        googleSignUp.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalToSuperview().multipliedBy(0.09)
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
        let vc = VerificationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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




