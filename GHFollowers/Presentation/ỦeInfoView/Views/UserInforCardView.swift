//
//  UserInforViewBody.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 7/4/24.
//

import Foundation
import UIKit

class UserInfoCardView: UIView{
    
    let leftTitleLabelWithIcon = AppLabelWithLeadingIcon(imageName: "", title: "",fontSize: 16)
    let rightTitleLabelWithIcon = AppLabelWithLeadingIcon(imageName: "", title: "",fontSize: 16)
    let leftCountBodyLabel = AppBodyLabel()
    let rightCountBodyLabel = AppBodyLabel()
    let cardButton = AppButton()
    
    let backgroundView = UIView()
    
    func configureViews(rightTitle: String, leftTitle: String,rightImageName: String, leftImageName: String, buttonTitle: String,rightCount: String, leftCount: String, buttonColor: UIColor){
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .secondarySystemBackground
        backgroundView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            backgroundView.widthAnchor.constraint(equalTo:  backgroundView.self.widthAnchor),
            
        ])
        
        backgroundView.addSubview(leftTitleLabelWithIcon)
        backgroundView.addSubview(leftCountBodyLabel)
        backgroundView.addSubview(rightTitleLabelWithIcon)
        backgroundView.addSubview(rightCountBodyLabel)
        backgroundView.addSubview(cardButton)

        leftTitleLabelWithIcon.titleLabelView.text = leftTitle
        rightTitleLabelWithIcon.titleLabelView.text = rightTitle
        
        leftTitleLabelWithIcon.iconView.image = UIImage(systemName: leftImageName)
        rightTitleLabelWithIcon.iconView.image = UIImage(systemName: rightImageName)
        
        cardButton.setTitle(buttonTitle, for: .normal)
        
        leftCountBodyLabel.text = rightCount
        rightCountBodyLabel.text = leftCount
        
        cardButton.setTitle(buttonTitle,for: .normal)
        cardButton.backgroundColor = buttonColor
        
        let padding = CGFloat(16)
        
        NSLayoutConstraint.activate([
            leftTitleLabelWithIcon.topAnchor.constraint(equalTo: self.topAnchor),
            leftTitleLabelWithIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            
            leftCountBodyLabel.topAnchor.constraint(equalTo: leftTitleLabelWithIcon.iconView.bottomAnchor,constant: 8),
            leftCountBodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            
            rightTitleLabelWithIcon.topAnchor.constraint(equalTo: self.topAnchor),
            rightTitleLabelWithIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            
            rightCountBodyLabel.topAnchor.constraint(equalTo: rightTitleLabelWithIcon.iconView.bottomAnchor,constant: 8),
            rightCountBodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            
            cardButton.topAnchor.constraint(equalTo: rightCountBodyLabel.bottomAnchor,constant: 16),
            cardButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            cardButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            cardButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: leftTitleLabelWithIcon.iconView.topAnchor,constant: -padding),
            backgroundView.bottomAnchor.constraint(equalTo: cardButton.bottomAnchor,constant: padding),
            backgroundView.leadingAnchor.constraint(equalTo: cardButton.leadingAnchor,constant: -padding),
            backgroundView.trailingAnchor.constraint(equalTo: cardButton.trailingAnchor,constant: padding)
            
        ])
    }
}
