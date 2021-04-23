//
//  Extensions.swift
//  instaclone
//
//  Created by ed on 23/04/2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

