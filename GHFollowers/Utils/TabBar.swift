//
//  TabBar.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

struct TabBar{
    private func createSearchNC() -> UINavigationController{
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem  = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    private func createFavoriteListNC() -> UINavigationController{
        let vc = FavoriteListViewController()
        vc.title = "Favorites"
        vc.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabBar.viewControllers = [createSearchNC(),createFavoriteListNC()]
        
        return tabBar
    }
}
