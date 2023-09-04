//
//  TransactionModel.swift
//  Budget
//
//  Created by shafique dassu on 03/09/2023.
//

import Foundation
import SwiftUI

enum TransactionType: String, CaseIterable {
    case income = "Income"
    case expense = "Expense"
}

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
    let type: TransactionType
    
    var displayDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
    
    var displayAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedAmount = formatter.string(from: amount as NSNumber)
        return formattedAmount ?? "$ 0.00"
    }
    
}

extension Transaction: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
