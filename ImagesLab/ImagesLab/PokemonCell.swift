//
//  PokemonCellTableViewCell.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
@IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    func configured(for pokemon: Cards) {
        nameLabel.text = pokemon.name
        ImageClient.fetchImage(for: pokemon.imageUrl)  { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.pokemonImage.image = image
                }
            }
        }
        
    }
    
}
