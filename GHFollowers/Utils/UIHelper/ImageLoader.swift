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
//    var image: UIImage = UIImage(named: "avatar-placeholder")!
//    
//    func load(fromUrlString: String) -> UIImage{
//
//             NetworkManager.shared.downloadedImage(fromURLString: fromUrlString){
//                uiImage in
//                 
//                 guard let uiImage = uiImage else {return}
//                 
//                 DispatchQueue.main.async{
//                     self.image = uiImage
//                 }
//            }
//        
//        return image
//        }
//
//}
