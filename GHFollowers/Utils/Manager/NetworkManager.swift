//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by User on 26/03/2024.
//

import Foundation
import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    let baseURL = "https://api.github.com/"
    
    private init(){
        
    }
    
    func getListFollowers(username: String, page: Int) async throws ->  [FollowerResponse] {
        guard let url = URL(string: baseURL + "users/\(username)/followers?per_page=100&page=\(page)") else{
            throw NetworkError.invalidUrl(message: "Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([FollowerResponse].self, from: data)
        }
        
        catch{
            throw NetworkError.invalidData(message: error.localizedDescription )
        }
        
    }
    
    //    func downloadedImage(fromURLString: String, completed: @escaping (UIImage?) -> Void){
    //        let cacheKey = NSString(string: fromURLString)
    //
    //        if let image = cache.object(forKey: cacheKey)
    //        {
    //            completed(image)
    //            return
    //        }
    //
    //        guard let url = URL(string: fromURLString) else{
    //            completed(nil)
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ [weak self]
    //            data, response, error in
    //
    //            guard let self = self else {return}
    //
    //            guard let data = data, let image = UIImage(data: data) else{
    //                completed(nil)
    //                return
    //            }
    //
    //            self.cache.setObject(image, forKey: cacheKey)
    //            completed(image)
    //        }
    //
    //        task.resume()
    //
    //    }
    
    func getUserDetail(username: String) async throws ->  UserDetailResponse {
        guard let url = URL(string: baseURL + "users/\(username)") else{
            throw NetworkError.invalidUrl(message: "Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(UserDetailResponse.self, from: data)
        }
        
        catch{
            throw NetworkError.invalidData(message: error.localizedDescription )
        }
        
    }
    
    func downloadedImage(fromURLString: String) async throws -> UIImage {
        let cacheKey = NSString(string: fromURLString)
        
        if let image = cache.object(forKey: cacheKey)
        {
            
            return image
        }
        
        guard let url = URL(string: fromURLString) else{
            
            throw NetworkError.invalidUrl(message: "Invalid URL")
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else {
                throw NetworkError.invalidData(message: "Invalid image data")
            }
            
            
            cache.setObject(image, forKey: cacheKey)
            return image
        }
        catch{
            throw NetworkError.unableToComplete(message: "Unable to complete")
        }
        
        
        
    }
    
    
    //    func getListFollowers(for username: String, page: Int, completed: @escaping (Result<[FollowerResponse], NetworkError>) -> Void) {
    //
    //        guard let url = URL(string: baseURL + "users/\(username)/followers?per_page=100&page=\(page)") else {
    //            completed(.failure(.invalidUrl(message: "Invalid URL")))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //
    //            if let _ = error {
    //                completed(.failure(.unableToComplete(message: "Unable to complete")))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse(message: "Invalid response")))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData(message: "Invalid data")))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                let followers = try decoder.decode([FollowerResponse].self, from: data)
    //                completed(.success(followers))
    //            } catch {
    //                completed(.failure(.invalidData(message: "Invalid data")))
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
}
