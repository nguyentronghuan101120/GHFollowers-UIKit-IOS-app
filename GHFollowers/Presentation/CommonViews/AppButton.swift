//
//  AppButton.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

class AppButton: UIButton{
    
    init(backgroundColor: UIColor = .systemBackground, title: String = ""){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title,for: .normal)
        
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints  = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
