//
//  UserInforViewBody.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 7/4/24.
//

import Foundation
import UIKit

class UserInforViewBody: UIView{
    
    var view: UIView!
    var data: UserDetailResponse!
    
    var githubProfilePublicReposTitle = AppTitleLabel()
    var githubProfilePublicGitsTitle = AppTitleLabel()
    
    var githubProfilePublicReposCount = AppBodyLabel()
    var githubProfilePublicGitsCount = AppBodyLabel( )

    var publicFollowingTitle = AppTitleLabel()
    var publicFollowerTitle = AppTitleLabel()
    
    var publicFollowingCount = AppBodyLabel()
    var publicFollowerCount = AppBodyLabel()
    
    var stackView = UIStackView()
    
    func addSubViews(view: UIView, data: UserDetailResponse){
        self.view = view
        self.data = data
        
//        configStackView()
        configGithubProfile()
    }
    
//    private func configStackView(){
//        view.addSubview(stackView)
//    
//        stackView.backgroundColor = .secondarySystemBackground
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.layer.cornerRadius = 16
//        
////        stackView.axis = .horizontal
////                stackView.distribution =  .equalSpacing
//        
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
// 
//            
//        ])
//    }
    
    private func configGithubProfile(){
        
        view.addSubview(githubProfilePublicReposTitle)
        view.addSubview(githubProfilePublicReposCount)
        
        githubProfilePublicReposCount.text = "100"
        githubProfilePublicReposTitle.text = "Public Repos"
        
        NSLayoutConstraint.activate([
            githubProfilePublicReposCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            githubProfilePublicReposTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
