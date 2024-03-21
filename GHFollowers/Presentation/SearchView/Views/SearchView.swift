//
//  File.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

final class SearchView{
    
    let logoImageView = UIImageView()
    let userNameTextField = AppTextField(placeholder: "Enter an username")
    let callToActionButton = AppButton(backgroundColor: .systemGreen, title: "Get followers")
    
    func addSubView(view: UIView){
        addLogoView(view: view)
        addTextField(view: view)
        addCallToActionButton(view: view)
    }
    
    func addLogoView(view: UIView){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "github-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 80),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func addTextField(view: UIView){
        view.addSubview(userNameTextField)

        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 40),
            
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addCallToActionButton(view: UIView){
        view.addSubview(callToActionButton)

        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
