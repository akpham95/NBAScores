//
//  ViewController.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/19/22.
//

import UIKit


///  Controller to house tabs and root tab controllers
final class NSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
 
    private func setUpTabs() {
        let gamebydateVC = NSGameByDateViewController()
        let standingsVC = NSStandingsViewController()
        
        
        gamebydateVC.navigationItem.largeTitleDisplayMode = .automatic
        standingsVC.navigationItem.largeTitleDisplayMode = .automatic
        

        
        let nav1 = UINavigationController(rootViewController: gamebydateVC)
        let nav2 = UINavigationController(rootViewController: standingsVC)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Scores",
                                       image: UIImage(systemName: "sportscourt"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Standings",
                                       image: UIImage(systemName: "list.number"),
                                       tag: 2)
        
        
        for nav in [nav1, nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2],
            animated: true
        )


    }
}

