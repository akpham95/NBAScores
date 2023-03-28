//
//  NSStandingsView.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/17/23.
//

import UIKit


final class NSStandingsView: UIView {
    

    private let viewModel = NSStandingsViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
    
        
        tableView.isHidden = true
        tableView.alpha = 0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NSStandingsTableViewCell.self, forCellReuseIdentifier: NSStandingsTableViewCell.cellIdentifier)
        tableView.register(StandingsHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return tableView
    }()
    
    
    // MARK: - Init
   
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubviews(tableView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchStandings()
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsuporrted")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setUpTableView(){
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    
        
    
}
// MARK: Delegate

extension NSStandingsView: NSStandingsViewViewModelDelegate {
    func didLoadInitialStandings() {
        tableView.reloadData()
        spinner.stopAnimating()
        tableView.isHidden = false
        tableView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.tableView.alpha = 1
        }
    }
}


