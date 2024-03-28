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
        loadImage(fromUrlString: follower.avatarUrl ?? "")
    }
    
    func loadImage(fromUrlString: String){
        NetworkManager.shared.downloadedImage(fromURLString: fromUrlString){
           uiImage in
            
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async{
                self.avatarImageView.image = uiImage
            }
       }
    }
    
}
