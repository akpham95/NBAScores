//
//  NSStandingsViewViewModel.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/17/23.
//

import UIKit

protocol NSStandingsViewViewModelDelegate: AnyObject {
    func didLoadInitialStandings()
}

final class NSStandingsViewViewModel: NSObject {
    
    public weak var delegate: NSStandingsViewViewModelDelegate?
    
    private var teams: [Team] = [] {
        didSet {
            for team in teams { let viewModel = NSStandingsTableViewCellViewModel(
                    teamID: team.TeamID,
                    key: team.Key,
                    city: team.City,
                    name: team.Name,
                    conference: team.Conference,
                    wins: team.Wins,
                    losses: team.Losses,
                    percentage: team.Percentage,
                    conferenceRank: team.ConferenceRank
                )
            /// appends each viewmodel response to empty array, sort each team object by their percentages
                cellViewModels.append(viewModel)
                cellViewModels.sort(by: { $0.percentage > $1.percentage})
            }
        }
    }
    
    private var cellViewModels: [NSStandingsTableViewCellViewModel] = []
    
    func fetchStandings(){
        NSService.shared.execute(NSRequest(endpoint: .Standings, pathComponents: ["2023"]), expecting: [Team].self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                
                let results = responseModel
                self?.teams = results
               
                DispatchQueue.main.async {
                    
                    self?.delegate?.didLoadInitialStandings()
                    
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

    extension NSStandingsViewViewModel: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cellViewModels.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStandingsTableViewCell.cellIdentifier, for: indexPath) as? NSStandingsTableViewCell else {
                fatalError("Unsupported cell")
            }
            cell.configure(with: cellViewModels[indexPath.row])
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? StandingsHeader
            return header
        }
        
    }

