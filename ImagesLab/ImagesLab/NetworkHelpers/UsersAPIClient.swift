//
//  UsersAPIClient.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct UsersAPIClient {
    static func getUsers(completion: @escaping (Result <[Users], AppError>)-> ()) {
        let endPointURL = "https://randomuser.me/api/?results=25"
        NetworkHelper.shared.performDataTask(with: endPointURL) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let user = try JSONDecoder().decode(RandomUsers.self, from: data)
                    let users = user.results
                    completion(.success(users))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
