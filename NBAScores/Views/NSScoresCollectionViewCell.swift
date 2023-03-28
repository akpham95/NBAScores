//
//  NSScoresCollectionViewCell.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import UIKit

/// Single cell for a Score
final class NSScoresCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "NSScoresCollectionViewCell"
    
    private let homeLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let awayLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let homeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let awayScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeScoreContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let awayScoreContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(homeLogo, awayLogo, homeScoreContainerView, awayScoreContainerView,vsLabel)
        homeScoreContainerView.addSubviews(homeTeamLabel, homeScoreLabel)
        //homeScoreContainerView.backgroundColor = .systemCyan
        awayScoreContainerView.addSubviews(awayTeamLabel, awayScoreLabel)
        //awayScoreContainerView.backgroundColor = .systemPink
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            homeScoreContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 45),
            homeScoreContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            homeScoreContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            homeScoreContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            homeScoreContainerView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            
            homeTeamLabel.leftAnchor.constraint(equalTo: homeScoreContainerView.leftAnchor),
            homeTeamLabel.rightAnchor.constraint(equalTo: homeScoreContainerView.rightAnchor),
            homeTeamLabel.topAnchor.constraint(equalTo: homeScoreContainerView.topAnchor),
            homeTeamLabel.bottomAnchor.constraint(equalTo: homeScoreContainerView.bottomAnchor),
            
            homeScoreLabel.leftAnchor.constraint(equalTo: homeScoreContainerView.leftAnchor,constant: 33),
            homeScoreLabel.rightAnchor.constraint(equalTo: homeScoreContainerView.rightAnchor),
            homeScoreLabel.topAnchor.constraint(equalTo: homeScoreContainerView.topAnchor,constant: 50),
            homeScoreLabel.bottomAnchor.constraint(equalTo: homeScoreContainerView.bottomAnchor),
            
            awayScoreContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 235),
            awayScoreContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            awayScoreContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            awayScoreContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            awayScoreContainerView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            
            awayTeamLabel.leftAnchor.constraint(equalTo: awayScoreContainerView.leftAnchor),
            awayTeamLabel.rightAnchor.constraint(equalTo: awayScoreContainerView.rightAnchor),
            awayTeamLabel.topAnchor.constraint(equalTo: awayScoreContainerView.topAnchor),
            awayTeamLabel.bottomAnchor.constraint(equalTo: awayScoreContainerView.bottomAnchor),
            
            awayScoreLabel.leftAnchor.constraint(equalTo: awayScoreContainerView.leftAnchor,constant: 33),
            awayScoreLabel.rightAnchor.constraint(equalTo: awayScoreContainerView.rightAnchor),
            awayScoreLabel.topAnchor.constraint(equalTo: awayScoreContainerView.topAnchor,constant: 50),
            awayScoreLabel.bottomAnchor.constraint(equalTo: awayScoreContainerView.bottomAnchor),
            
            homeLogo.centerYAnchor.constraint(equalTo: homeScoreContainerView.centerYAnchor,constant: -60),
            homeLogo.widthAnchor.constraint(equalToConstant: 75),
            homeLogo.heightAnchor.constraint(equalToConstant: 75),
            homeLogo.centerXAnchor.constraint(equalTo: homeScoreContainerView.centerXAnchor),
            
            awayLogo.centerYAnchor.constraint(equalTo: awayScoreContainerView.centerYAnchor,constant: -60),
            awayLogo.widthAnchor.constraint(equalToConstant: 75),
            awayLogo.heightAnchor.constraint(equalToConstant: 75),
            awayLogo.centerXAnchor.constraint(equalTo: awayScoreContainerView.centerXAnchor),
            
            
            vsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 30),
            vsLabel.leadingAnchor.constraint(equalTo: homeScoreContainerView.trailingAnchor),
            vsLabel.trailingAnchor.constraint(equalTo: awayScoreContainerView.leadingAnchor),
            
        ])
        
       // homeTeamLabel.backgroundColor = .blue
        //homeScoreLabel.backgroundColor = .blue
        
       // awayTeamLabel.backgroundColor = .red
       // awayScoreLabel.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        homeLogo.image = nil
        awayLogo.image = nil
        homeTeamLabel.text = nil
        homeScoreLabel.text = nil
        awayTeamLabel.text = nil
        awayScoreLabel.text = nil
        vsLabel.text = nil
    }
    
    
    public func configure(with viewModel: NSScoresCollectionViewCellViewModel) {
        homeTeamLabel.text = viewModel.homeTeam
        homeScoreLabel.text = "\(viewModel.homeTeamScore)"
        awayTeamLabel.text = viewModel.awayTeam
        awayScoreLabel.text = "\(viewModel.awayTeamScore)"
        
        homeLogo.image = UIImage(named: viewModel.homeTeam)
        awayLogo.image = UIImage(named: viewModel.awayTeam)
        
        vsLabel.text = "vs"
    }

    
}
