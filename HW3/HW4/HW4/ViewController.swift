//
//  ViewController.swift
//  HW3
//
//  Created by 김민섭 on 2023/09/30.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")?.withTintColor(.white) //
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.white) //
        vc3.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")?.withTintColor(.white)
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")?.withTintColor(.white) //
        vc5.tabBarItem.image = UIImage(systemName: "line.3.horizontal")?.withTintColor(.white) //
    
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Coming Soon"
        vc4.title = "Downloads"
        vc5.title = "More"
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
        }
}

