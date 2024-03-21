//
//  FollowersListViewController.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

class FollowersListViewController: UIViewController{
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
