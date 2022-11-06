//
//  UniverseSearchViewController+DataSource.swift
//  Tars
//
//  Created by 김소현 on 2022/11/04.
//

import UIKit

extension UniverseSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectPlanetCollectionViewCell.identifier, for: indexPath) as? SelectPlanetCollectionViewCell
            else { return UICollectionViewCell() }
        
        // reusable cell init
        cell.backgroundView = nil
        cell.planetNameLabel.textColor = .white
        
        let selectedPlanetName = planetList[indexPath.row].planetName
        let selectedPlanetImage = planetList[indexPath.row].planetImage
        
        cell.planetNameLabel.text = selectedPlanetName
        cell.planetImageView.image = selectedPlanetImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectPlanetCollectionViewCell else { return }

        if cell.isSelected {
            DispatchQueue.main.async {
                cell.planetNameLabel.textColor = .black
                cell.backgroundView = cell.planetBackgroundView
                // TODO: Fix title error
                self.navigationController?.navigationItem.title = "천체 탐색 중"
                self.navigationController?.navigationBar.backgroundColor = .systemYellow
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectPlanetCollectionViewCell {
            cell.planetNameLabel.textColor = .white
            cell.backgroundView = nil
        }
    }
}
