//
//  PreferenceKeys.swift
//  qlick
//
//  Created by Brian Mwangi on 08/07/2022.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
