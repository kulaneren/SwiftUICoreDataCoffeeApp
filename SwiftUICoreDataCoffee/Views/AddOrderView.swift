//
//  AddOrderView.swift
//  SwiftUICoreDataCoffee
//
//  Created by eren kulan on 10/11/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @State var addOrderVM = AddOrderViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Name", text: self.$addOrderVM.personName)
                
                Picker(selection: self.$addOrderVM.type, label: Text("")) {
                    Text("Cappucino").tag("tag")
                    Text("Regular").tag("reg")
                    Text("Espresso").tag("esp")
                }.pickerStyle(SegmentedPickerStyle())
                
                Button("Place Order"){
                    self.addOrderVM.saveOrder()
                    self.isPresented = false
                }.padding(8)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                
            }.padding()
                
                .navigationBarTitle("Add Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(true))
    }
}
