////
////  ImageLoader.swift
////  GHFollowers
////
////  Created by User on 28/03/2024.
////
//
//import Foundation
//import UIKit
//
//class ImageLoader {
//    static func loadFromURL(fromUrlString: String) {
//        Task.init {
//            do{
//                return try await NetworkManager.shared.downloadedImage(fromURLString: fromUrlString)
//            }
//            catch {
//                return UIImage(named: "avatar-placeholder")!
//            }
//        }
//    }
//}
