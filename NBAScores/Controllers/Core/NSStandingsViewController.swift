//
//  NSStandingsViewController.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/30/22.
//

import UIKit

/// Controller to show standings in Western and Eastern Conference
final class NSStandingsViewController: UIViewController {
    
    private let standingsView = NSStandingsView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Standings"
        
        setUpView()
        
    }
    
    private func setUpView() {
        view.addSubview(standingsView)
        NSLayoutConstraint.activate([
            standingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            standingsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            standingsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            standingsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
   
            
    

}
