//
//  AddTransactionView.swift
//  Budget
//
//  Created by shafique dassu on 30/08/2023.
//

import SwiftUI

struct AddTransactionView: View {
    @State var amount: Double = 0
    @State var title = ""
    @State var type: TransactionType = .expense
    @State var test: NSNumber = 0
    @Binding var transactions: [Transaction]
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    var body: some View {
        VStack {
            CurrencyField(placeholder: "Test", amount: $test)
                TextField("$0.00", value: $amount, formatter: numberFormatter)
                    .font(.system(size: 60, weight: .thin))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.plain)
                    .overlay(alignment: .trailing) {
                        Text("USD")
                            .padding(6)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(5)
                            .padding(.trailing, 30)
                    }
//                HStack {
//                    Spacer()
//                    Text("USD")
//                        .padding(6)
//                        .background(Color.gray.opacity(0.4))
//                        .cornerRadius(5)
//                        .padding(.trailing, 30)
//                }
            
            
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
                let newTransaction = Transaction(title: title, amount: amount, date: Date(), type: type)
                transactions.append(newTransaction)
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
        AddTransactionView(transactions: .constant([]))
    }
}
