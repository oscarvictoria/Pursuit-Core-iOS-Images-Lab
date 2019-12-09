//
//  PokemonViewController.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pokeCards = [Cards]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadCards()
    }
    
    func loadCards() {
        PokemonAPIClient.getCards { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("Error \(error)")
            case .success(let card):
                self?.pokeCards = card
            }
        }
    }
    

}

extension PokemonViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath)
        let card = pokeCards[indexPath.row]
        cell.textLabel?.text = card.name
        return cell
    }
}
