//
//  CurrencyFieldView.swift
//  Budget
//
//  Created by shafique dassu on 27/09/2023.
//

import Foundation
import SwiftUI



struct CurrencyFieldView: UIViewRepresentable {
    
    @Binding var amount: Double
    let placeholder: String
    
    //1. creates a UIView (text field)
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.delegate = context.coordinator //(equiv. of textField.delegate = self but making use of coordinator note: coordinator is of type CFCoord)
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return textField
    }
    //2. updates state of the UIView (text field) (when binding in use)
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = context.coordinator.textFor(value: amount)
    }
    //4. make aware of coordinator via function - create an instance of CFCoordinator class below because it is outside of struct. now context is aware of coordinator
    //context has a coordinator and gets access to this one here. 
    //make coordinator available through UIViewRep. Must edit return type to expected coordinator to be used.
    func makeCoordinator() -> CurrencyFieldCoordinator {
        return CurrencyFieldCoordinator(amount: $amount)
    }
}
//3. coordinator used in order to make use of delegates on the view being brought in - without this function can't use delegates. make it conform to desired delegate (UITextFieldD) - gives us access to shouldChange delegate
//returns a bool stating whether change is poss or not
class CurrencyFieldCoordinator: NSObject, UITextFieldDelegate {
    @Binding var amount: Double
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
    init(amount: Binding<Double>) {
        _amount = amount
    }
    func textFor(value: Double) -> String? {
        return formatter.string(from: value as NSNumber)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let currentText = textField.text else { return }
        let strippedText = currentText.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "$", with: "")
        guard let textDouble = Double(strippedText) else { return }
        guard let formattedText = formatter.string(for: textDouble) else {
            return
        }
        textField.text = formattedText
    }
}
