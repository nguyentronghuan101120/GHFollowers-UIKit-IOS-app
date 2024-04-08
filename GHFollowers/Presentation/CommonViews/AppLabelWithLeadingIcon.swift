//
//  AppLabelWithLeadingIcon.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 8/4/24.
//

import Foundation
import UIKit

class AppLabelWithLeadingIcon: UIView{
    
    var titleLabelView = AppTitleLabel()
    var iconView = UIImageView()
    
    init(imageName: String, title: String,fontSize: CGFloat){
        super.init(frame:.zero)
        
        self.addSubview(iconView)
        self.addSubview(titleLabelView)
        
        translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        iconView.image = UIImage(systemName:  imageName)
        iconView.tintColor = .label
        iconView.contentMode = .scaleAspectFill
        
        titleLabelView.text = title
        titleLabelView.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            
            
            titleLabelView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            titleLabelView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            titleLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
