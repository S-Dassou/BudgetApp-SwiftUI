//
//  AddTransactionView.swift
//  Budget
//
//  Created by shafique dassu on 30/08/2023.
//

import SwiftUI

struct AddTransactionView: View {
    @State var amount = ""
    @State var title = ""
    @State var type: TransactionType = .expense
    
    var body: some View {
        VStack {
            TextField("$0.00", text: $amount)
                .textFieldStyle(.plain)
            
            Picker("choose a type", selection: $type) {
                ForEach(TransactionType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            .pickerStyle(.inline)
            
            TextField("title", text: $title)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
            Button {
                
            } label: {
                Text("Create")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color("primary"))
                    .cornerRadius(6)
                    .padding(.horizontal, 30)
            }

            Spacer()
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
