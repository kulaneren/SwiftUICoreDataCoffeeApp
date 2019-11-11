//
//  ContentView.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 09/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(orderVM)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(self.orderListVM.orders, id: \.personName) { order in
                    HStack {
                        Image("latte")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        Text(order.personName)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                        
                    }
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("DISMISSED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                self.orderListVM.fetchAllOrders()
            }, content: {
                AddOrderView(isPresented: self.$isPresented)
            })
                .navigationBarTitle("Orders")
                .navigationBarItems(trailing: Button("Add New Order"){
                    self.isPresented = true
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
