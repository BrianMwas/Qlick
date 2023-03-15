//
//  HexagonView.swift
//  qlick
//
//  Created by Brian Mwangi on 01/07/2022.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Image(systemName: "hexagon")
            .symbolVariant(.fill)
            .foregroundColor(.blue)
            .font(.system(size: 200))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
