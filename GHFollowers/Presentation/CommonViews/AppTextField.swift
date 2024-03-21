//
//  AppTextField.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

class AppTextField: UITextField{
    init(placeholder: String,keyboardType: UIKeyboardType = UIKeyboardType.default,returnKeyType: UIReturnKeyType = UIReturnKeyType.default){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        self.placeholder            = placeholder
        self.returnKeyType          = returnKeyType
        self.keyboardType           = keyboardType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
