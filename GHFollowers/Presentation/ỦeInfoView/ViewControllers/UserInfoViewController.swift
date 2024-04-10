//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 6/4/24.
//

import Foundation
import UIKit
class UserInfoViewController: UIViewController{
    
    var userName: String!
    
    var userInfoView =  UserInfoView()
    
    var userDetail: UserDetailResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        getUserDetail()
        
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
    func getUserDetail(){
        showLoadingView()
        Task.init {
            do {
                let data = try await NetworkManager.shared.getUserDetail(username: userName)
                
                userDetail = data
                
                self.dismissLoadingView()
                
                view.addSubview(userInfoView)
                userInfoView.configureViews(data: data, parentView: view)
                
            } catch {
                presentAlertOnMainThread(title: "Error", message: error.localizedDescription, buttonTitle: "OK")
                self.dismissLoadingView()
            }
        }
    }
    
}

extension UserInfoViewController: ButtonDelegate{
    func buttonTapped() {
        print("hello")
    }
    
    
}
