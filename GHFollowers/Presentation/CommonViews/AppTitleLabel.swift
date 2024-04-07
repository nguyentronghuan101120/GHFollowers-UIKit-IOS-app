//
//  AppTitleLabel.swift
//  GHFollowers
//
//  Created by User on 25/03/2024.
//

import Foundation
import UIKit

final class AppTitleLabel: UILabel{
    
    init(textAlignment: NSTextAlignment = .center, fontSize: CGFloat = 24){
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight:  .bold)
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
