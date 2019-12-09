//
//  Appartment.swift
//  ARC
//
//  Created by Oscar Victoria Gonzalez  on 12/9/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

class Apartment {
  var unit: String
  var tenant: Person?
  init(unit: String) {
    self.unit = unit
    print("\(unit) was created.")
  }
  deinit {
    print("\(unit) is being deinitialized.")
  }
}
