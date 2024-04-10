//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 6/4/24.
//

import Foundation
import UIKit

protocol ButtonDelegate: AnyObject{
    func buttonTapped()
}

class UserInfoView: UIView{
    
    weak var delegate: ButtonDelegate!
    
    let header: UserInfoHeaderView = UserInfoHeaderView()
    let gitHubProfile = UserInfoCardView()
    let followView = UserInfoCardView()
    let gitHubSince = AppBodyLabel()
    let button = AppButton(backgroundColor: .red,title: "OK")
    
    func configureViews(data: UserDetailResponse, parentView: UIView){
        
//        self.delegate = delegate
        
        self.addSubview(header)
        self.addSubview(gitHubProfile)
        self.addSubview(followView)
        self.addSubview(gitHubSince)
        self.addSubview(button)
        
        header.configureView(data)
        
        gitHubProfile.configureViews(rightTitle: "Public Gists", leftTitle: "Public Repos", rightImageName: "text.alignleft", leftImageName: "folder", buttonTitle: "Github profile", rightCount: String(data.publicGists ?? 0), leftCount: String(data.publicRepos ?? 0),buttonColor: .systemPurple)
        
        followView.configureViews(rightTitle: "Followers", leftTitle: "Following", rightImageName: "person.2", leftImageName: "heart", buttonTitle: "Get followers", rightCount: String(data.followers ?? 0), leftCount: String(data.following ?? 0), buttonColor: .systemGreen)
        
        if(data.createdAt != nil){
            gitHubSince.text = "Github since \(data.createdAt!.convertToDisplayFormat())"
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            header.trailingAnchor.constraint(equalTo: parentView.trailingAnchor,constant: -16),
            header.leadingAnchor.constraint(equalTo: parentView.leadingAnchor,constant: 16),
            
            gitHubProfile.backgroundView.topAnchor.constraint(equalTo: header.followerBio.bottomAnchor,constant: 24),
            gitHubProfile.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            gitHubProfile.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            
            followView.backgroundView.topAnchor.constraint(equalTo: gitHubProfile.backgroundView.bottomAnchor,constant: 24),
            followView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            followView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            
            gitHubSince.topAnchor.constraint(equalTo: followView.backgroundView.bottomAnchor, constant: 24),
            gitHubSince.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: gitHubSince.bottomAnchor,constant: 24),
            button.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        ])

    }
}

