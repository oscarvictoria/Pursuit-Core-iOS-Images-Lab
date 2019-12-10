//
//  ViewController.swift
//  ImagesLab
//
//  Created by Oscar Victoria Gonzalez  on 12/7/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ComicsViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepperLabel: UIStepper!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ComicAPIClient.getComics { result in
            switch result {
            case .failure(let error):
                print("failure: \(error)")
            case .success(let comics):
                dump(comics)
            }
        }
    }
    
    func configuredStepper() {
        stepperLabel.minimumValue = 0.0
        stepperLabel.maximumValue = 100
        stepperLabel.value = 1.0
        stepperLabel.stepValue = 1.0
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
    }
    
    
    
    @IBAction func mostRecentButton(_ sender: UIButton) {
        
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        
    }
    

}

