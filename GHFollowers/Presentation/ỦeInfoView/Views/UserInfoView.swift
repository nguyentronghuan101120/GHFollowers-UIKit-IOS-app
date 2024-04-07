//
//  UserInfoView.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 6/4/24.
//

import Foundation
import UIKit
class UserInfoView: UIView{
    

    var header: UserInforHeaderView = UserInforHeaderView()
    var body = UserInforViewBody()
    
    func addSubView(_ view: UIView, data: UserDetailResponse){
   
        header.addSubView(view: view, data: data)
        
        body.addSubViews(view: view, data: data)
        
        NSLayoutConstraint.activate([
            
        ])
     
    }
}
