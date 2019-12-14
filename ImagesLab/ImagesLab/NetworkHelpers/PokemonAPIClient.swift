//
//  PokemonAPIClient.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct PokemonAPIClient {
    static func getCards(completion: @escaping (Result<[Cards],AppError>)-> ()) {
        let endpointURL = "https://api.pokemontcg.io/v1/cards"
        
        NetworkHelper.shared.performDataTask(with: endpointURL) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let card = try JSONDecoder().decode(Pokemon.self , from: data)
                    let someCards = card.cards
                    completion(.success(someCards))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
    }
    
}
