//
//  Constants.swift
//  moneysave
//
//  Created by ericzero on 5/24/23.
//

import UIKit

enum OnboardingType {
    case pageOne
    case pageTwo
    case pageThree
    
    var image: UIImage? {
        switch self {
        case .pageOne: return UIImage(named: "")
        case .pageTwo: return UIImage(named: "")
        case .pageThree: return UIImage(named: "")
        }
    }
}
