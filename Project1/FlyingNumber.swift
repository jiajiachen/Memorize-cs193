//
//  FlyingNumber.swift
//  Project1
//
//  Created by Kelly Chen on 2024/10/3.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
        
    }
}

#Preview {
    FlyingNumber(number: 5)
}
