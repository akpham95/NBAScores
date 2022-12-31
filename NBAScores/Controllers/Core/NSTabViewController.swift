//
//  ViewController.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/19/22.
//

import UIKit

final class NSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
 
    private func setUpTabs() {
        let gamebydateVC = NSGameByDateViewController()
        let standingsVC = NSStandingsViewController()
        let settingsVC = NSSettingsViewController()
        
        gamebydateVC.navigationItem.largeTitleDisplayMode = .automatic
        standingsVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        
        let nav1 = UINavigationController(rootViewController: gamebydateVC)
        let nav2 = UINavigationController(rootViewController: standingsVC)
        let nav3 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Scores",
                                       image: UIImage(systemName: "sportscourt"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Standings",
                                       image: UIImage(systemName: "list.number"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 3)
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3],
            animated: true
        )


    }
}

