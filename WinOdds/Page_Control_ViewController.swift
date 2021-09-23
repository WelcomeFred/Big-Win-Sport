//
//  Page_Control_ViewController.swift
//  WinOdds
//
//  Created by Valodya Galstyan on 8/8/19.
//  Copyright © 2019 Ֆրեդ. All rights reserved.
//

import UIKit

class Page_Control_ViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    let imgArray = ["image_1", "image_2", "image_3", "image_4", "image_5", "image_6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStatusBarStyle(.lightContent)
        pageControl.numberOfPages = imgArray.count
        self.scrollView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupScrollView()
    }
    
    func setupScrollView() {
        for i in 0..<imgArray.count {
            let imgView = UIImageView()
//            imgView.contentMode = .scaleAspectFit
            imgView.image = UIImage(named: imgArray[i])
            let posX = CGFloat(i) * self.view.bounds.size.width
            imgView.frame = CGRect(x: posX, y: 0, width: view.frame.size.width, height: self.scrollView.frame.height)
            imgView.backgroundColor = .clear
            scrollView.addSubview(imgView)
        }
        scrollView.contentSize.width = view.frame.size.width * CGFloat(imgArray.count)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        
        pageControl.currentPage = Int(page)
    }
}
