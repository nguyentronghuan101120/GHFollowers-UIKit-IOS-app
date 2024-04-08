//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 6/4/24.
//

import Foundation
import UIKit
class UserInfoView: UIView{
    

    let header: UserInforHeaderView = UserInforHeaderView()
    let githubProfile = UserInfoCardView()
    let followView = UserInfoCardView()
    let githubSince = AppBodyLabel()
    
    func configureViews(_ data: UserDetailResponse, _ parentView: UIView){
        
        self.addSubview(header)
        self.addSubview(githubProfile)
        self.addSubview(followView)
        self.addSubview(githubSince)
        
        header.configureView(data)
        
        githubProfile.configureViews(rightTitle: "Public Gists", leftTitle: "Public Repos", rightImageName: "text.alignleft", leftImageName: "folder", buttonTitle: "Github profile", rightCount: String(data.publicGists ?? 0), leftCount: String(data.publicRepos ?? 0),buttonColor: .systemPurple)
        
        followView.configureViews(rightTitle: "Followers", leftTitle: "Following", rightImageName: "person.2", leftImageName: "heart", buttonTitle: "Get followers", rightCount: String(data.followers ?? 0), leftCount: String(data.following ?? 0), buttonColor: .systemGreen)
        
        if(data.createdAt != nil){
            githubSince.text = "Github since \(data.createdAt!.convertToDisplayFormat())"
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
            header.trailingAnchor.constraint(equalTo: parentView.trailingAnchor,constant: -16),
            header.leadingAnchor.constraint(equalTo: parentView.leadingAnchor,constant: 16),

            githubProfile.backgroundView.topAnchor.constraint(equalTo: header.followerBio.bottomAnchor,constant: 24),
            githubProfile.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            githubProfile.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            
            followView.backgroundView.topAnchor.constraint(equalTo: githubProfile.backgroundView.bottomAnchor,constant: 24),
            followView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16),
            followView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16),
            
            githubSince.topAnchor.constraint(equalTo: followView.backgroundView.bottomAnchor, constant: 24),
            githubSince.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            githubSince.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16)
        ])
    }
}
