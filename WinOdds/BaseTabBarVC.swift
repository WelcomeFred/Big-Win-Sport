//
//  BaseTabBarVC.swift
//  WinOdds
//
//  Created by Valodya Galstyan on 8/8/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit

class BaseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.selectedIndex = 1
        
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [BaseTabBarVC.self])
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        self.tabBar.unselectedItemTintColor = UIColor.white
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)], for: .selected)
        UITabBar.appearance().tintColor = UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)
        
    }
}

extension UIViewController {
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
     //  if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
         //  statusBar.backgroundColor = style == .lightContent ? UIColor.black : .white
      //      statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
//   }
    }
}
