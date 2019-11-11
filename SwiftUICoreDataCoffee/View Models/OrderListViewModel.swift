//
//  OrdersListViewModel.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 10/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.gellAllOrders().map(OrderViewModel.init)
        print(self.orders)
    }
    
    func deleteOrder(_ orderVm: OrderViewModel) {
        CoreDataManager.shared.deleteOrder(personName: orderVm.personName)
        fetchAllOrders()
    }
    
}

class OrderViewModel {
    
    var personName = ""
    var type = ""
    
    init(order: Order) {
        if let pName = order.personName{
            self.personName = pName
        }
        if let type = order.type{
            self.type = type
        }
    }
}
