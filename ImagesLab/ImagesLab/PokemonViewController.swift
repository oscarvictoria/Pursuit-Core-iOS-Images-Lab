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
@IBOutlet weak var searchBar: UISearchBar!
    
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
        tableView.delegate = self
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? PokemonCell else {
            fatalError("error")
        }
        let card = pokeCards[indexPath.row]
        cell.configured(for: card)
        return cell
    }
}

extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
