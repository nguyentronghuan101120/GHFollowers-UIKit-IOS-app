//
//  FollowersListViewController.swift
//  GHFollowers
//
//  Created by User on 21/03/2024.
//

import Foundation
import UIKit

class FollowersListViewController: UIViewController{
 
    
    enum Section{
        case main
    }
    
    var userName: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, FollowerResponse>!
    
    var listFollower: [FollowerResponse] = []
    
    var searchingListFollower: [FollowerResponse] = []
    
    var page: Int = 1
    var hasMoreFollower: Bool = false
    var isSearching: Bool = false
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        configureSearchController()
        configureViewController()
   
        configureCollectionView()
        getListFollowers(page: page)
       configureDataSource()
    
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
  
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout:UIHelper.createThreeColumnFlowLayout(view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func getListFollowers(page: Int){
        showLoadingView()
                Task.init {
                do {
                    let followers = try await NetworkManager.shared.getListFollowers(username: userName, page: page)
                    
                    if followers.count > 100 {self.hasMoreFollower = false} else { self.hasMoreFollower = true}
                    
                    if followers.isEmpty{
                       let message = "This user doesn't have any followers"
                        DispatchQueue.main.async{
                            self.showEmptyStateView(message: message, view: self.view)
                        }
                    }
                    else{
                        self.listFollower.append(contentsOf: followers)
                        self.updateData(on: self.listFollower)
                    }
                 
                    self.dismissLoadingView()
                } catch {
                    presentAlertOnMainThread(title: "Error", message: error.localizedDescription, buttonTitle: "OK")
                    self.dismissLoadingView()
                }
            }
    }
    
    func configureDataSource(){
     
        dataSource = UICollectionViewDiffableDataSource<Section,FollowerResponse>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, followerResponse ) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            
            cell.set(follower: followerResponse)
            
            return cell
        })
    }
    
    func updateData(on followerList: [FollowerResponse]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, FollowerResponse>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followerList)
     
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for an username"
//        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}


extension FollowersListViewController: UICollectionViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height{
            
            guard hasMoreFollower else {
                return
            }
            
            getListFollowers(page: page+1)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activeArray = isSearching ? searchingListFollower : listFollower

        let followerTapped = activeArray[indexPath.item]
        
        let destinationViewController = UserInfoViewController()
        destinationViewController.userName = followerTapped.login
        
        let navController = UINavigationController(rootViewController: destinationViewController)
        
        present(navController, animated: true)
    }
}

extension FollowersListViewController: UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else{
            isSearching = false
            return
        }
        
        searchingListFollower = listFollower.filter({ $0.login!.lowercased().contains(filter.lowercased())
        })
        
        updateData(on: searchingListFollower)
        
        isSearching = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(on: listFollower)
        isSearching = false
    }
    
}
