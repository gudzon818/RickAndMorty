//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by user on 04.02.2023.
//

import UIKit

final class RMCharactersListViewModel: NSObject {
   public func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url "+String(model.results.first?.image ?? "No image"))
               
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
    }
}

extension RMCharactersListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
       ) as? RMCharacterCollectionViewCell else {
           fatalError("Unsupported cell")
       }
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterName: "Kirill",
            characterStatus: .alive,
            characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(
            width: width,
            height: width * 1.5
        
        )
    }
}
