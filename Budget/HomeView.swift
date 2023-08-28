//
//  ContentView.swift
//  Budget
//
//  Created by shafique dassu on 27/08/2023.
//

import SwiftUI

enum TransactionType {
    case income
    case expense
}

struct Transaction: Identifiable {
    let id = UUID()
    let amount: Double
    let type: TransactionType
    var displayAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedAmount = formatter.string(from: amount as NSNumber)
        return formattedAmount ?? "$ 0.00"
    }
}
struct HomeView: View {
    @State var transactions: [Transaction] = [
        Transaction(amount: 3.00, type: .income),
        Transaction(amount: 5.00, type: .expense)
    ]
    fileprivate func BalanceView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("primary"))
            VStack(alignment: .leading) {
                HStack {
                    Text("BALANCE")
                        .font(.caption)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding([.top, .leading])
                
                HStack {
                    Text("$0.00")
                        .foregroundColor(.white)
                        .font(.system(size: 42, weight: .light))
                }
                .padding(.leading)
                HStack(spacing: 25) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Income")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                        Text("$0.00")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.white)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Expenses")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                        Text("$0.00")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading)
                .padding(.top, 5)
                Spacer()
            }
        }
        .shadow(color: Color.black.opacity(0.3) ,radius: 10, x: 0, y: 5)
        .frame(height: 150)
        .padding(.horizontal)
    }
    
    var body: some View {
        VStack {
       BalanceView()
            List(transactions, id: \.id) { transaction in
                HStack {
                    Text("\(transaction.displayAmount)")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
