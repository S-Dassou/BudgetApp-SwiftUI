//
//  CurrencyFieldView.swift
//  Budget
//
//  Created by shafique dassu on 27/09/2023.
//

import Foundation
import SwiftUI

struct CurrencyFieldView: UIViewRepresentable {
    //1. creates a UIView (text field)
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator //(equiv. of textField.delegate = self but making use of coordinator note: coordinator is of type CFCoord)
        return textField
    }
    //2. updates state of the UIView (when binding in use)
    func updateUIView(_ uiView: UITextField, context: Context) {
        <#code#>
    }
    //4. make aware of coordinator via function - create an instance of CFCoordinator class below because it is outside of struct. now context is aware of coordinator
    func makeCoordinator() -> CurrencyFieldCoordinator {
        return CurrencyFieldCoordinator()
    }
}
//3. coordinator used in order to make use of delegates on the view being brought in - without this function can't use delegates. make it conform to desired delegate (UITextFieldD) - gives us access to shouldChange delegate
//returns a bool stating whether change is poss or not
class CurrencyFieldCoordinator: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        <#code#>
    }
}
