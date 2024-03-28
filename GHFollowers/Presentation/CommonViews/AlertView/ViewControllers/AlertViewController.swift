//
//  AlertViewController.swift
//  GHFollowers
//
//  Created by User on 25/03/2024.
//

import Foundation
import UIKit

 class AlertViewController: UIViewController{
     let alertView = AlertView()

     var alertTitle: String?
     var message: String?
     var buttonTitle: String?
      
      init(alertTitle: String, message: String, buttonTitle: String) {
          super.init(nibName: nil, bundle: nil)
          self.alertTitle = alertTitle
          self.message = message
          self.buttonTitle = buttonTitle
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
     override func viewDidLoad() {
 
         super.viewDidLoad()
         view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
         alertView.addSubviews(view,alertTitle: alertTitle ?? "Something went wrong",buttonTitle: buttonTitle ?? "Ok",selector: #selector(dismissView),alertBodyTitle: message ?? "Unable to complete",alertViewControllerToDismiss: self)
     }
     
     @objc func dismissView(){
         dismiss(animated: true)
     }

}
