//
//  UsersDetailViewController.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class UsersDetailViewController: UIViewController {
    
var theUsers: Users?
    
@IBOutlet weak var detailImage: UIImageView!
@IBOutlet weak var detailName: UILabel!
@IBOutlet weak var detailAge: UILabel!
@IBOutlet weak var detailPhone: UILabel!
@IBOutlet weak var detailLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
   
    func updateUI() {
        guard let users = theUsers else {
            fatalError("error")
        }
        detailAge.text = users.dob.age.description
        detailName.text = users.name.fullName
        detailPhone.text = users.phone
        detailLocation.text = "\(users.location.city), \(users.location.state), \(users.location.country)"
        ImageClient.fetchImage(for: users.picture.large) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailImage.image = image
                }
            }
        }
    }


}
