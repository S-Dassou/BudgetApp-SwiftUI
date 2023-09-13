//
//  CurrencyField.swift
//  Budget
//
//  Created by shafique dassu on 07/09/2023.
//

import SwiftUI

struct CurrencyField: View {
    
    let placeholder: String
    @Binding var amount: NSNumber
    @State var isEditing = false
    @State var valueWhileEditing = ""
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
    
    var formattedValue: String {
        return numberFormatter.string(from: amount) ?? ""
    }
    
    var body: some View {
        TextField(placeholder, text: Binding(get: {
            if isEditing {
                return valueWhileEditing
            } else {
                return "\(Double(truncating: amount))"
            }
        }, set: { value in
            let number = value.filter { "01234567890.".contains($0) }
            if number.filter({$0 == "."}).count <= 1 {
                valueWhileEditing = number
            } else {
                let newValue = String(number.dropLast(number.count - valueWhileEditing.count))
                valueWhileEditing = newValue
            }
            updateValue(with: valueWhileEditing)
//            if let numberAsDouble = Double(number) {
//                amount = numberAsDouble as NSNumber
//            }
        })) { isEditing in
            self.isEditing = isEditing
        }
    }
    
    func updateValue(with inputAmount: String) {
        if let newValue = numberFormatter.number(from: valueWhileEditing) {
            amount = newValue
        }
    }
}

struct CurrencyField_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyField(placeholder: "$0.00", amount: .constant(0.00 as NSNumber))
    }
}
