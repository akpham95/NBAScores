//
//  ScoresView.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import UIKit

final class NSScoresView: UIView {

    private let viewModel = NSScoresViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NSScoresCollectionViewCell.self,
                                forCellWithReuseIdentifier: NSScoresCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(collectionView, spinner)
        
        addConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        //viewModel.fetchScores()
        viewModel.fetchScores(selectedDate: viewModel.getYesterdaysDate())
        setUpCollectionView()
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
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension NSScoresView: NSScoresViewViewModelDelegate {
    func didLoadInitialScores() {
        collectionView.reloadData()
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData() //Initial fetch of characters
        UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
    }


