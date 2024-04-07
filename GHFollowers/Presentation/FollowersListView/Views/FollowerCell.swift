//
//
//  FollowerListCell.swift
//  GHFollowers
//
//  Created by User on 27/03/2024.
//

import Foundation
import UIKit
class FollowerCell: UICollectionViewCell{

    static let reuseID = "FollowerCell"
    
    let avatarImageView = FollowerAvatarImageView()
    let usernameLabel = AppTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure(){
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            avatarImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,constant:16),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: FollowerResponse){
        usernameLabel.text = follower.login
        loadImage(from: follower.avatarUrl ?? "")
    }
    
    func loadImage(from urlImage: String){
        Task.init {
            do{
                avatarImageView.image =    try await NetworkManager.shared.downloadedImage(fromURLString: urlImage)
            }
            catch {
                avatarImageView.image =    UIImage(named: "avatar-placeholder")!
            }
        }
        
    }
    
}
