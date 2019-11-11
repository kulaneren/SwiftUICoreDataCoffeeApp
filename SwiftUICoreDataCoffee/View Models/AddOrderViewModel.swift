//
//  AddOrderViewModel.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 10/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation
import SwiftUI

class AddOrderViewModel {
    
    var personName: String = ""
    var type: String = ""
    
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: self.personName, type: self.type)
    }
    
}
