//
//  FollowerAvatarImageView.swift
//  GHFollowers
//
//  Created by User on 27/03/2024.
//

import Foundation
import UIKit

class FollowerAvatarImageView: UIImageView{

    init(){
        super.init(frame: .zero)
        layer.cornerRadius = 10
        clipsToBounds = true
        image = UIImage(named: "avatar-placeholder")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
