//
//  UserDetailResponse.swift
//  GHFollowers
//
//  Created by User on 26/03/2024.
//

import Foundation
struct UserDetailResponse: Codable{
    var login: String?
    var avatarUrl:String?
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int?
    var publicGists: Int?
    var htmlUrl: String?
    var following: Int?
    var followers: Int?
    var createdAt: String?
}
