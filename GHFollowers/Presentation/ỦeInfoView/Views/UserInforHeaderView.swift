//
//
//  UserInforViewHeader.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 7/4/24.
//

import Foundation
import UIKit

class UserInforHeaderView: UIView {
    var followerAvatar = FollowerAvatarImageView()
    var followerNickName = AppTitleLabel()
    var followerFullName = AppBodyLabel()
    var followerBio = AppBodyLabel(textAlignment: .justified, numberOfLines: 3)
    
    var flowerLocation = AppBodyLabel()
    
    var data: UserDetailResponse!
    
    func configureView(_ data: UserDetailResponse){
        
        self.data = data
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addAvatarView()
        addFollowerNickNameView()
        addFollowerFullNameView()
        addFollowerLocation()
        addFollowerBioView()
        
    }
    
    func addAvatarView(){
        
        self.addSubview(followerAvatar)
        
        loadImage(from: data.avatarUrl ?? "")
        
        NSLayoutConstraint.activate([
            followerAvatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            followerAvatar.widthAnchor.constraint(equalToConstant:100),
            followerAvatar.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func addFollowerNickNameView(){
        self.addSubview(followerNickName)
        
        followerNickName.text = data.login
        
        NSLayoutConstraint.activate([
            followerNickName.topAnchor.constraint(equalTo: followerAvatar.topAnchor),
            followerNickName.leadingAnchor.constraint(equalTo: followerAvatar.trailingAnchor, constant: 8),
            
        ])
    }
    
    func addFollowerFullNameView(){
        self.addSubview(followerFullName)
        
        followerFullName.text = data.name
        
        NSLayoutConstraint.activate([
            followerFullName.topAnchor.constraint(equalTo: followerNickName.bottomAnchor,constant: 8),
            followerFullName.leadingAnchor.constraint(equalTo: followerAvatar.trailingAnchor, constant: 8)
        ])
    }
    
    func addFollowerLocation(){
        self.addSubview(flowerLocation)
        
        flowerLocation.text = data.location ?? "This user does not have location"
        
        NSLayoutConstraint.activate([
            flowerLocation.topAnchor.constraint(equalTo: followerFullName.bottomAnchor,constant: 8),
            flowerLocation.leadingAnchor.constraint(equalTo: followerAvatar.trailingAnchor, constant: 8)
        ])
    }
    
    func addFollowerBioView(){
        self.addSubview(followerBio)
        
        followerBio.text = data.bio
        
        NSLayoutConstraint.activate([
            followerBio.topAnchor.constraint(equalTo: followerAvatar.bottomAnchor,constant: 8),
            followerBio.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            followerBio.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
        ])
    }
    
    func loadImage(from urlImage: String){
        Task.init {
            do{
                followerAvatar.image =    try await NetworkManager.shared.downloadedImage(fromURLString: urlImage)
            }
            catch {
                followerAvatar.image =    UIImage(named: "avatar-placeholder")!
            }
        }
        
    }
    
}
