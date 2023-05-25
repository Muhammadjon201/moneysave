//
//  TextFieldFactory.swift
//  moneysave
//
//  Created by ericzero on 5/25/23.
//

import UIKit

class TextfieldFactory {
    static func createTextField(placeholder: String, color: UIColor) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.backgroundColor = color
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.2
        return textField
    }
}
