//
//  PokemonDetailViewController.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
var detailCards: Cards?
    
@IBOutlet weak var detailImageView: UIImageView!
@IBOutlet weak var detailNameLabel: UILabel!
@IBOutlet weak var detailTypesLabel: UILabel!
@IBOutlet weak var detailWeaknessLabel: UILabel!
@IBOutlet weak var detailSetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        
        
        guard let theCards = detailCards else {
            fatalError("error")
        }
        
        guard let weaknesses = theCards.weaknesses else {
                return
        }
        
        guard let types = theCards.types else {
            return
        }
        
        for type in types {
            detailTypesLabel.text = "Type - \(type)"
        }
        
        for weakness in weaknesses {
            detailWeaknessLabel.text = "Weakness - \(weakness.type)"
        }
        detailNameLabel.text = theCards.name
        detailSetLabel.text = theCards.set
//        detailWeaknessLabel.text = weak
        ImageClient.fetchImage(for: theCards.imageUrlHiRes)  { [weak self] (result) in
                 switch result {
                 case .failure(let error):
                     print("error \(error)")
                 case .success(let image):
                     DispatchQueue.main.async {
                        self?.detailImageView.image = image
                     }
                 }
             }
    }
}



