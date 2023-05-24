//
//  OnboardingViewController.swift
//  moneysave
//
//  Created by ericzero on 5/24/23.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
        
    private lazy var landingImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "Illustration")
        return img
    }()
    
    private lazy var nameTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Gain total control of your money"
        lbl.font = .systemFont(ofSize: 32, weight: .medium)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var descriptionTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Become your own money manager and make every cent count"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        setButtons()
    }
    
    @objc func signUpButtonTapped(){
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped(){
        print("Login")
    }
}

//MARK: - SetUpUI

extension OnboardingViewController {
    
    func setConstraints(){
        view.addSubview(landingImg)
        view.addSubview(nameTitle)
        view.addSubview(descriptionTitle)
        
        landingImg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        nameTitle.snp.makeConstraints { make in
            make.top.equalTo(landingImg.snp.bottom).offset(40)
            make.left.equalTo(50)
            make.right.equalTo(-50)
        }
        
        descriptionTitle.snp.makeConstraints { make in
            make.top.equalTo(nameTitle.snp.bottom).offset(17)
            make.left.equalTo(50)
            make.right.equalTo(-50)
        }
    }
    
    func setButtons(){
        
        let loginButton = CustomButtonFactory.createButton(title: "Login", color: UIColor(named: "signInColor")!, titleColor: UIColor(named: "launchColor")!)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(56)
        }
        
        let signUpButton = UIButton()
        signUpButton.applySignUpStyle()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(loginButton.snp.top).offset(-15)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(56)
        }
    }
}
