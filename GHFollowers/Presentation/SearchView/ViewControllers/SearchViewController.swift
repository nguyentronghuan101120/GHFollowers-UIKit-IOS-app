//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        searchView.addSubView(view: view)
        
        searchView.userNameTextField.delegate = self
        
        searchView.callToActionButton.addTarget(self, action: #selector(navigateToFollowersListVC), for: .touchUpInside)
        
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func navigateToFollowersListVC(){
        
        guard (!(searchView.userNameTextField.text?.isEmpty ?? true)) else{
            presentAlertOnMainThread(title: "Empty username", message: "Please enter username, we need to know who to look for", buttonTitle: "OK")
            return
        }
        
        let followersListVC = FollowersListViewController()
        
        followersListVC.userName = searchView.userNameTextField.text
        followersListVC.title = searchView.userNameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}

extension SearchViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        navigateToFollowersListVC()
        return true
    }
}
