//
//  RandomUserCell.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class RandomUserCell: UITableViewCell {


@IBOutlet weak var userImage: UIImageView!
@IBOutlet weak var userNameLabel: UILabel!
@IBOutlet weak var userAgeLabel: UILabel!
@IBOutlet weak var userCellLabel: UILabel!
    
    func configured(for user: Users) {
        userNameLabel.text = user.name.fullName
        userAgeLabel.text = user.dob.age.description
        userCellLabel.text = user.cell
        ImageClient.fetchImage(for: user.picture.thumbnail) { (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.userImage.image = image
                }
            }
        }
    }
}
