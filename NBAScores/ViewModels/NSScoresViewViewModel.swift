//
//  ScoresViewViewModel.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import UIKit

protocol NSScoresViewViewModelDelegate: AnyObject {
    func didLoadInitialScores()
}

final class NSScoresViewViewModel: NSObject {
    
    public weak var delegate: NSScoresViewViewModelDelegate?
    
    private var games: [Game] = [] {
        didSet {
            for game in games {
                
                let viewModel = NSScoresCollectionViewCellViewModel(
                    homeTeam: game.HomeTeam,
                    homeTeamScore: game.HomeTeamScore ?? 0,
                    awayTeam: game.AwayTeam,
                    awayTeamScore: game.AwayTeamScore ?? 0,
                    homeTeamImageURL: nil
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [NSScoresCollectionViewCellViewModel] = []
    
    func fetchScores(selectedDate: String){
        NSService.shared.execute(NSRequest(endpoint: .GamesByDate, pathComponents: [selectedDate]), expecting: [Game].self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel
                print(responseModel)
                self?.games = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialScores()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getTodaysDate() -> String {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MMM-d"
        let todaysDateString = dateFormatter.string(from: todaysDate).uppercased()
        print(todaysDateString)
        return todaysDateString
    }
    
    
    func getYesterdaysDate() -> String {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MMM-d"
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: todaysDate) ?? todaysDate
        let yesterdaysDateString = dateFormatter.string(from: yesterdayDate).uppercased()
        print(yesterdaysDateString)
        return yesterdaysDateString
    }
}


extension NSScoresViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: NSScoresCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? NSScoresCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-15)
        return CGSize (
            width: width,
            height: width/2
        )
    }
}

