//
//  AlertView.swift
//  GHFollowers
//
//  Created by User on 25/03/2024.
//

import Foundation
import UIKit
final class AlertView{
    let containerView = UIView()
    
    let titleLabel = AppTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = AppBodyLabel(textAlignment: .center)
    let actionButton = AppButton(backgroundColor: .systemGreen, title: "Ok")
    
    func addSubviews(_ view: UIView,alertTitle: String,buttonTitle: String,selector: Selector, alertBodyTitle: String,alertViewControllerToDismiss: Any?) {
        addContainerView(view)
        addTitleLabelView(alertTitle)
        addActionButtonView(buttonTitle: buttonTitle, selector: selector,alertViewControllerToDismiss: alertViewControllerToDismiss)
        addBodyLabelView(alertBodyTitle)
    }
      
    func addContainerView(_ view: UIView) {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ]
        )
    }
    
    func addTitleLabelView(_ alertTitle: String){
        containerView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func addActionButtonView(buttonTitle: String, selector: Selector, alertViewControllerToDismiss: Any){
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle, for: .normal)
        
        actionButton.addTarget(alertViewControllerToDismiss, action: selector, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
           actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
           actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
           actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
           actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func addBodyLabelView(_ title: String){
        containerView.addSubview(messageLabel)
        
        messageLabel.text = title

        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
           messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
           messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
           messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
           messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
  
}
