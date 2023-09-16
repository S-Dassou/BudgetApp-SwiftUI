//
//  ContentView.swift
//  Budget
//
//  Created by shafique dassu on 27/08/2023.
//

import SwiftUI


struct HomeView: View {
    @State var transactions: [Transaction] = [
        Transaction(title: "Work", amount: 3.00, date: Date(), type: .income),
        Transaction(title: "iOS", amount: 5.00, date: Date(), type: .expense)
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
    
    fileprivate func TransactionImage(transaction: TransactionType) -> some View {
        Image(systemName: transaction == .income ? "arrow.up.forward" : "arrow.down.forward")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(transaction == .income ? Color.green : Color.red)
    }
    
    fileprivate func FloatingButton() -> some View {
        VStack {
            Spacer()
            HStack {
                    NavigationLink {
                        AddTransactionView()
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                    }
                    .background(Color("primary"))
                    .clipped()
                    .cornerRadius(40)
            }
        }
    }
     
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
               BalanceView()
                    List(transactions) { transaction in
                        NavigationLink {
                            AddTransactionView()
                        } label: {
                            ListRowView(transaction: transaction)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                FloatingButton()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ListRowView: View {
    let transaction: Transaction
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(transaction.displayDate)")
                    .font(.system(size: 14, weight: .bold))
                Spacer()
            }
            .padding(.vertical, 5)
            .background(Color("primaryShade").opacity(0.5))
            .cornerRadius(5)
            HStack {
                Image(systemName: transaction.type == .income ? "arrow.up.forward": "arrow.down.forward")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(transaction.type == .income ? Color.green : Color.red)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("\(transaction.title)")
                        Spacer()
                        Text("\(transaction.displayAmount)")
                    }
                    .font(.system(size: 14, weight: .bold))
                    Text("Completed")
                        .font(.system(size: 14))
                }
                Spacer()
            }
        }
    }
}
