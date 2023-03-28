//
//  NSStandingsTableViewCell.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/18/23.
//

import UIKit

final class NSStandingsTableViewCell: UITableViewCell {
    static let cellIdentifier = "NSStandingsTableViewCell"
    
    private let teamLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let teamNameContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let recordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    private let recordsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(teamNameContainerView,recordsContainerView)
        teamNameContainerView.addSubviews(teamLabel,teamLogo)
        recordsContainerView.addSubviews(recordLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            
            
            teamNameContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            teamNameContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            teamNameContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),
            teamNameContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            teamNameContainerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            teamLogo.topAnchor.constraint(equalTo: teamNameContainerView.topAnchor),
            teamLogo.bottomAnchor.constraint(equalTo: teamNameContainerView.bottomAnchor),
            teamLogo.leadingAnchor.constraint(equalTo: teamNameContainerView.leadingAnchor),
            teamLogo.trailingAnchor.constraint(equalTo: teamLabel.leadingAnchor,constant: -5),
            teamLogo.heightAnchor.constraint(equalToConstant: 25),
            teamLogo.widthAnchor.constraint(equalToConstant: 25),
            
            teamLabel.topAnchor.constraint(equalTo: teamNameContainerView.topAnchor),
            teamLabel.bottomAnchor.constraint(equalTo: teamNameContainerView.bottomAnchor),
            teamLabel.leadingAnchor.constraint(equalTo: teamLogo.trailingAnchor),
            teamLabel.trailingAnchor.constraint(equalTo: teamNameContainerView.trailingAnchor),
            
    
            recordsContainerView.leadingAnchor.constraint(equalTo: teamNameContainerView.trailingAnchor),
            recordsContainerView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            recordsContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),
            recordsContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            recordLabel.topAnchor.constraint(equalTo: recordsContainerView.topAnchor),
            recordLabel.bottomAnchor.constraint(equalTo: recordsContainerView.bottomAnchor),
            recordLabel.leadingAnchor.constraint(equalTo: recordsContainerView.leadingAnchor),
            recordLabel.trailingAnchor.constraint(equalTo: recordsContainerView.trailingAnchor,constant: -15),
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teamLabel.text = nil
        recordLabel.text = nil
       
    }
    
    public func configure(with viewModel: NSStandingsTableViewCellViewModel) {
        teamLabel.text = "\(viewModel.city) \(viewModel.name)"
        recordLabel.text = "\(viewModel.wins) - \(viewModel.losses)"
        
        teamLogo.image = UIImage(named: viewModel.key)
        
    }
    
    
}
