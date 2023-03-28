//
//  NSStandingsHeader.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/19/23.
//

import UIKit

final class StandingsHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    private let recordsLabel: UILabel = {
        let label = UILabel()
        label.text = "W - L"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.text = "Team"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier:  reuseIdentifier)
        contentView.addSubviews(recordsLabel,teamLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recordsLabel.sizeToFit()
        recordsLabel.frame = CGRect(
            x: 0, y: contentView.frame.size.height-10-recordsLabel.frame.size.height,
            width: contentView.frame.size.width-25,
            height: recordsLabel.frame.size.height)
        
        teamLabel.sizeToFit()
        teamLabel.frame = CGRect(
            x: 15, y: contentView.frame.size.height-10-teamLabel.frame.size.height,
            width: contentView.frame.size.width,
            height: teamLabel.frame.size.height)
    }
    
}

