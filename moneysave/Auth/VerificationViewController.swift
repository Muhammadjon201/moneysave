//
//  VerificationViewController.swift
//  moneysave
//
//  Created by Bektemur Mamashayev on 25/05/23.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your Verification Code"
        label.font = .systemFont(ofSize: 36, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = TextfieldFactory.createTextField(
            placeholder: "",
            color: .white
        )
        textField.font = .systemFont(ofSize: 32, weight: .regular)
        textField.keyboardType = .numberPad
        textField.textContentType = .password
        return textField
    }()
    
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "We send verification code to your email brajaoma*****@gmail.com. You can check your inbox."
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var sendAgainButton: UIButton = {
        let button = CustomButtonFactory.createButton(
            title: "I didn’t received the code? Send again",
            color:  .white
        )
        button.setTitleColor(UIColor(named: "launchColor"), for: .normal)
        button.addTarget(self, action: #selector(sendAgainTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var verifyButton: UIButton = {
        let button = CustomButtonFactory.createButton(
            title: "Verify",
            color: UIColor(named: "launchColor")!
        )
        button.addTarget(self, action: #selector(verifyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - Update UI
extension VerificationViewController {
    
    private func setupUI() {
        title = "Verification"
        view.backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(100)
            maker.left.right.equalToSuperview().inset(20)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { maker in
            maker.top.equalTo(mainLabel).inset(140)
            maker.left.equalToSuperview().inset(20)
            maker.right.equalToSuperview().inset(140)
        }
        
        view.addSubview(notificationLabel)
        notificationLabel.snp.makeConstraints { maker in
            maker.top.equalTo(textField).inset(50)
            maker.left.right.equalTo(20)
        }
        
        let verticalStackView = UIStackView(arrangedSubviews: [ sendAgainButton, verifyButton])
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 20
        verticalStackView.distribution = .fillProportionally
        
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { maker in
            maker.top.equalTo(notificationLabel).inset(80)
            maker.left.right.equalToSuperview().inset(20)
        }
        
    }
}
//MARK: - Private Methods
private extension VerificationViewController {
    
    @objc func sendAgainTapped() {
        print("Send again button pressed")
    }
    
    @objc func verifyButtonPressed() {
        print("Verify button pressed")
    }
}
