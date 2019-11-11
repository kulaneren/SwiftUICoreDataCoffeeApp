//
//  CoreDataManager.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 10/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    //singleton
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func gellAllOrders() -> [Order] {
        var orders = [Order]()
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try self.moc.fetch(orderRequest)
        }catch let error as NSError {
            print(error)
        }
        
        return orders
    }
    
    func saveOrder(name: String, type: String) {
        let order = Order(context: self.moc)
        order.personName = name
        order.type = type
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func fetchOrder(personName: String) -> Order? {
        var orders = [Order]()
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "personName == %@", personName)
        
        do{
            orders = try self.moc.fetch(request)
        }catch let error as NSError{
            print(error)
        }
        
        return orders.first
    }
    
    func deleteOrder(personName: String) {
        do {
            if let order = fetchOrder(personName: personName) {
                self.moc.delete(order)
                try self.moc.save()
            }
        }catch let error as NSError {
            print(error)
        }
    }
}
