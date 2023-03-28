//
//  NSGameByDateViewController.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/30/22.
//

import UIKit

/// Controller to show game scores
final class NSGameByDateViewController: UIViewController {
    
    private let scoresView = NSScoresView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Scores"
        setUpView()
    }
    
    private func setUpView(){
        view.addSubview(scoresView)
        NSLayoutConstraint.activate([
            scoresView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoresView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scoresView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scoresView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
