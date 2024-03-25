//
//  AppTitleLabel.swift
//  GHFollowers
//
//  Created by User on 25/03/2024.
//

import Foundation
import UIKit

final class AppBodyLabel: UILabel{
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
