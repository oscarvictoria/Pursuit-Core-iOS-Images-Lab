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
    
    var someComic = [Comic]()
    
    
    var theComic: Double = 620 {
        didSet {
            print("comic \(stepperLabel.value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    
        
    }
    
//    Double(someComic.first?.num ?? 7)
//    Double(someComic.last?.num ?? 100)
    func configuredStepper() {
        stepperLabel.minimumValue = 600
        stepperLabel.maximumValue = 610
        stepperLabel.value = Double(someComic.first?.num ?? 7)
        stepperLabel.stepValue = 1
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        ComicAPIClient.getComics(stepperValue: Int(sender.value)) { (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let comic):
                ImageClient.fetchImage(for: comic.img) { (result) in
                    switch result {
                    case .failure(let error):
                        print("error \(error)")
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                        
                    }
                }
            }
        }
    }
    
    
    
    @IBAction func mostRecentButton(_ sender: UIButton) {
        
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        ComicAPIClient.getComics(stepperValue: Int.random(in: 1...630)) { (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let comic):
                print(comic)
                ImageClient.fetchImage(for: comic.img) { (result) in
                    switch result {
                    case .failure(let error):
                        print("error \(error)")
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
        }
    }
    
    
}

extension ComicsViewController: UITextFieldDelegate {
    
}
