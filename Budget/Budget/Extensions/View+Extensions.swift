//
//  View+Extensions.swift
//  Budget
//
//  Created by 이태현 on 2022/04/06.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
}
