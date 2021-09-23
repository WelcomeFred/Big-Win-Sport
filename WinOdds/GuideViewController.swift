//
//  GuideViewController.swift
//  WinOdds
//
//  Created by Valodya Galstyan on 7/30/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//
//
import UIKit
//
class GuideViewController: UIViewController {
//
    override func viewDidLoad() {
//        
//
        self.setStatusBarStyle(.lightContent)
        super.viewDidLoad()
        self.tabBarController?.tabBar.barTintColor = .black
        self.tabBarController!.tabBar.isTranslucent = false
        self.tabBarController!.tabBar.tintColor = UIColor(red: 102/255, green: 204/255, blue: 154/255, alpha: 1)
        self.tabBarController!.tabBar.unselectedItemTintColor = .white
    }
}
