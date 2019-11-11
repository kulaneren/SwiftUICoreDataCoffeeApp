//
//  NSManagedObjectContext+Extensions.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 10/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
