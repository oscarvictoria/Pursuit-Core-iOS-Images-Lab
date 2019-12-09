//
//  UsersViewController.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
@IBOutlet weak var tableView: UITableView!
    
    var people = [Users]() {
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
        loadUsers()
    }
    
    func loadUsers() {
        UsersAPIClient.getUsers { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let person):
                self?.people = person
            }
        }
    }
    
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? RandomUserCell else {
            fatalError("error")
        }
        let randomUser = people[indexPath.row]
        cell.configured(for: randomUser)
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
