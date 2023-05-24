//
//  ButtonFactory.swift
//  moneysave
//
//  Created by ericzero on 5/25/23.
//

import UIKit

//protocol ButtonFactory {
//    func createButton() -> UIButton
//}
//
//class CustomButtonFactory: ButtonFactory {
//
//    let title: String
//    let color: UIColor?
//    let action: UIAction
//
//    init(title: String, color: UIColor, action: UIAction) {
//        self.title = title
//        self.color = color
//        self.action = action
//    }
//
//    func createButton() -> UIButton {
//        // Set attributes for button title
//        var attributes = AttributeContainer()
//        attributes.font = UIFont.boldSystemFont(ofSize: 18)
//
//        // Set configuration for button
//        var buttonConfiguration = UIButton.Configuration.filled()
//        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
//        buttonConfiguration.baseBackgroundColor = color
//
//        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }
//
//}

class CustomButtonFactory {
    @objc static func createButton(title: String, color: UIColor, titleColor: UIColor = .white) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
}
