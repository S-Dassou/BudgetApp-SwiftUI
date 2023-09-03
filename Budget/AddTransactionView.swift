//
//  AddTransactionView.swift
//  Budget
//
//  Created by shafique dassu on 30/08/2023.
//

import SwiftUI

struct AddTransactionView: View {
    @State var amount = ""
    
    var body: some View {
        VStack {
            TextField("$0.00", text: $amount)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
