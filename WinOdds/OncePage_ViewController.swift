//
//  OncePage_ViewController.swift
//  WinOdds
//
//  Created by Ֆրեդ on 8/4/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit
import Lottie

class OncePage_ViewController: UIViewController {

    @IBOutlet weak var viewForAnimation: UIView!
    
    var animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBarStyle(.lightContent)
        startAnimation()
        self.perform(#selector(goToHomePage), with: nil, afterDelay: 5)
    }
    

    func startAnimation() {
        self.showLoader(view: self.viewForAnimation, filename: "calc2")
    }
    
    func showLoader(view: UIView, filename:String) {
        
        animationView = AnimationView(frame: view.frame)
        animationView.animation = Animation.named(filename)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.frame = view.bounds
        view.addSubview(animationView)
        animationView.play()
        
    }
    
    func hideLoader() {
        self.animationView.stop()
        self.animationView.removeFromSuperview()
    }

    @objc func goToHomePage() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BaseTabBarVC") as? BaseTabBarVC
        
        self.present(vc!, animated: true, completion: nil)
    }
}
